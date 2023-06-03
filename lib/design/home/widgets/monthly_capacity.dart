import 'package:employee_self_service_flutter/constant/enum.dart';
import 'package:employee_self_service_flutter/constant/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class MonthProgress {
  final String month;
  final bool isCurrentMonth;

  MonthProgress({required this.month, this.isCurrentMonth = false});
}

class CustomStepProgressIndicator extends StatefulWidget {
  final int totalSteps;
  final int currentStep;
  final double stepWidth;
  final double stepHeight;
  final double stepPadding;
  final List<Color> stepColors;
  final Color selectedColor;
  final Color unselectedColor;
  final BorderRadius borderRadius;
  final int currentMonth;

  const CustomStepProgressIndicator({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    this.stepWidth = 50,
    this.stepHeight = 5,
    this.stepPadding = 4,
    required this.stepColors,
    required this.selectedColor,
    required this.unselectedColor,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(4),
      bottomLeft: Radius.circular(4),
      topRight: Radius.circular(4),
      bottomRight: Radius.circular(4),
    ),
    required this.currentMonth,
  }) : super(key: key);

  @override
  _CustomStepProgressIndicatorState createState() =>
      _CustomStepProgressIndicatorState();
}

class _CustomStepProgressIndicatorState
    extends State<CustomStepProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController selectedAnimationController;

  @override
  void initState() {
    super.initState();
    selectedAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    selectedAnimationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    selectedAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.stepWidth,
      height: 85,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.totalSteps,
          (index) {
            final bool isSelected = index < widget.currentStep;
            final bool isFade =
                index > widget.currentStep + 1; // Determine if step should fade
            final Color stepColor = isSelected
                ? widget.selectedColor
                : widget.stepColors[index]; // Assign color based on selection

            final double translateY =
                isSelected ? selectedAnimationController.value * 10.0 : 0.0;
            return Expanded(
              child: AnimatedOpacity(
                opacity: isFade
                    ? (1 - selectedAnimationController.value)
                    : 1.0, // Adjust opacity for fading effect
                duration: const Duration(milliseconds: 500),
                child: AnimatedBuilder(
                  animation: selectedAnimationController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, translateY),
                      child: Container(
                        width: widget.stepWidth,
                        height: widget.stepHeight,
                        margin: EdgeInsets.only(bottom: widget.stepPadding),
                        decoration: BoxDecoration(
                          borderRadius: widget.borderRadius,
                          color: stepColor, // Set the color of the step
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProgressIndicatorColumn extends StatefulWidget {
  final List<MonthProgress> monthProgressList;
  final int currentMonthIndex;

  const ProgressIndicatorColumn({
    Key? key,
    required this.monthProgressList,
    required this.currentMonthIndex,
  }) : super(key: key);

  @override
  ProgressIndicatorColumnState createState() => ProgressIndicatorColumnState();
}

class ProgressIndicatorColumnState extends State<ProgressIndicatorColumn> {
  final ScrollController scrollController = ScrollController();
  double currentMonthOffset = 0.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToCurrentMonth();
        scrollController.position;
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToCurrentMonth() {
    final screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = 80.0;
    final visibleItems = screenWidth ~/ itemWidth;
    final totalWidth = widget.monthProgressList.length * itemWidth;
    currentMonthOffset = widget.currentMonthIndex * itemWidth;
    double minOffset = 0.0;
    final maxOffset = (totalWidth - visibleItems * itemWidth)
        .clamp(minOffset, double.infinity);
    double targetOffset;
    if (currentMonthOffset < screenWidth / 1) {
      targetOffset = minOffset;
    } else if (currentMonthOffset > (totalWidth - screenWidth / 1)) {
      targetOffset = maxOffset;
    } else {
      targetOffset = currentMonthOffset - (screenWidth / 1 - itemWidth / 1);
    }

    scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themePro = ThemeNotifier.of(context, listen: false);
    return Column(
      children: [
        Text.rich(
          TextSpan(
              text: 'Today\n',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.surface),
              children: [
                TextSpan(
                    text: DateFormat('EEEE, MMMM dd').format(DateTime.now()),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.surface))
              ]),
          textAlign: TextAlign.center,
        ).paddingAll(20),
        Stack(
          children: [
            Container(
              height: 300,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: themePro.themeMode == ThemeModeType.dark
                    ? LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                          ])
                    : const LinearGradient(colors: [
                        Colors.transparent,
                        Colors.transparent,
                      ]),
                border: Border.all(
                    color: Theme.of(context).colorScheme.primary, width: 0.2),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 190,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.monthProgressList.length,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        final currentMonth =
                            widget.monthProgressList[index].isCurrentMonth;
                        return Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 20),
                          decoration: BoxDecoration(
                            gradient:
                                widget.monthProgressList[index].isCurrentMonth
                                    ? LinearGradient(
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter,
                                        colors: [
                                            Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.1),
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.transparent,
                                            Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.1),
                                          ])
                                    : const LinearGradient(colors: [
                                        Colors.transparent,
                                        Colors.transparent,
                                      ]),
                            border: Border.all(
                              width: 0.3,
                              color:
                                  widget.monthProgressList[index].isCurrentMonth
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.transparent,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '1500%',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ).paddingBottom(5),
                              Transform.rotate(
                                angle: 3.14,
                                child: CustomStepProgressIndicator(
                                  selectedColor:
                                      Theme.of(context).colorScheme.tertiary,
                                  unselectedColor: Colors.white24,
                                  totalSteps: 10,
                                  currentStep: index + 1,
                                  stepColors: const [
                                    Colors.greenAccent,
                                    Colors.red,
                                    Colors.indigo,
                                    Colors.black,
                                    Colors.grey,
                                    Colors.white24,
                                    Colors.greenAccent,
                                    Colors.yellow,
                                    Colors.yellow,
                                    Colors.yellow,
                                  ],
                                  currentMonth: currentMonth ? index : -1,
                                ),
                              ),
                              Divider(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              Text(
                                widget.monthProgressList[index].month,
                                style: TextStyle(
                                  color: widget.monthProgressList[index]
                                          .isCurrentMonth
                                      ? Theme.of(context).colorScheme.surface
                                      : Theme.of(context).colorScheme.primary,
                                  fontWeight: widget.monthProgressList[index]
                                          .isCurrentMonth
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Container(
                  height: 0.6,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [
                            Theme.of(context).colorScheme.background,
                            Theme.of(context).colorScheme.background,
                            Theme.of(context).colorScheme.background,
                          ])),
                ),
              ),
            ),
            Positioned(
                top: 0,
                left: 20,
                child: Text(
                  'Monthly Capacity',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

class MonthlyCapacity extends StatelessWidget {
  const MonthlyCapacity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MonthProgress> monthProgressList = [
      MonthProgress(month: "January"),
      MonthProgress(month: "February"),
      MonthProgress(month: "March"),
      MonthProgress(month: "April"),
      MonthProgress(month: "May"),
      MonthProgress(month: "June", isCurrentMonth: true),
      MonthProgress(month: "July"),
      MonthProgress(month: "August"),
      MonthProgress(month: "September"),
      MonthProgress(month: "October"),
      MonthProgress(month: "November"),
      MonthProgress(month: "December"),
    ];

    int currentMonthIndex = DateTime.now().month - 1;

    return ProgressIndicatorColumn(
      monthProgressList: monthProgressList,
      currentMonthIndex: currentMonthIndex,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/decoration_card.dart';

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
  CustomStepProgressIndicatorState createState() =>
      CustomStepProgressIndicatorState();
}

class CustomStepProgressIndicatorState
    extends State<CustomStepProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController fadeAnimationController;

  @override
  void initState() {
    super.initState();
    fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    fadeAnimationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedColor = widget.selectedColor.withOpacity(0.5);
    final unselectedColor = widget.unselectedColor.withOpacity(0.2);

    return SizedBox(
      width: widget.stepWidth,
      height: 85,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.totalSteps,
          (index) {
            final bool isSelected = index < widget.currentStep;
            final bool isCurrentMonth = widget.currentMonth == index;
            final bool isFade =
                isCurrentMonth && index == widget.currentStep - 1;
            final Color stepColor = isSelected
                ? (isFade ? selectedColor : widget.selectedColor)
                : unselectedColor;
            return Expanded(
              child: AnimatedBuilder(
                animation: fadeAnimationController,
                builder: (context, child) {
                  final double opacity = isFade
                      ? fadeAnimationController.value
                      : 1.0; // Adjust opacity for fading effect
                  return Opacity(
                    opacity: opacity,
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
            DecorationCard(
              height: 300,
              margin: const EdgeInsets.only(top: 10),
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
              top: 9.8,
              left: 17,
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Container(
                  height: 0.8,
                  width: 110,
                  color: Theme.of(context).colorScheme.background.withOpacity(0.9),
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class MonthProgress {
  final String month;
  final bool isCurrentMonth;

  MonthProgress({required this.month, this.isCurrentMonth = false});
}

class CustomStepProgressIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final double stepWidth;
  final double stepHeight;
  final double stepPadding;
  final Color selectedColor;
  final Color unselectedColor;
  final BorderRadius borderRadius;

  const CustomStepProgressIndicator({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    this.stepWidth = 30,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: stepWidth,
      height: 85,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          totalSteps,
          (index) {
            final bool isSelected = index < currentStep;
            return Expanded(
              child: Container(
                width: stepWidth,
                height: stepHeight,
                margin: EdgeInsets.only(bottom: stepPadding),
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  gradient: isSelected
                      ? LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                              Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(0.9),
                              Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(0.8),
                              Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(0.7),
                              Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(0.6),
                              Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(0.5),
                              Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(0.4),
                              Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(0.3),
                              Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(0.2),
                              Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(0.1),
                            ])
                      : LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                              unselectedColor,
                              unselectedColor,
                              unselectedColor
                            ]),
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

    return Stack(
      children: [
        Container(
          height: 300,
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: Theme.of(context).colorScheme.primary, width: 0.2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Text(
                  'Today \n${DateFormat('EEEE dd').format(DateTime.now())}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.monthProgressList.length,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: widget.monthProgressList[index].isCurrentMonth
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '1500',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ).paddingBottom(5),
                          Transform.rotate(
                            angle: 3.14,
                            child: CustomStepProgressIndicator(
                              selectedColor:
                                  Theme.of(context).colorScheme.tertiary,
                              unselectedColor: Colors.white24,
                              totalSteps: 10,
                              currentStep: index + 1,
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text(
                            widget.monthProgressList[index].month,
                            style: TextStyle(
                              color:
                                  widget.monthProgressList[index].isCurrentMonth
                                      ? Theme.of(context).colorScheme.surface
                                      : Theme.of(context).colorScheme.primary,
                              fontWeight:
                                  widget.monthProgressList[index].isCurrentMonth
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

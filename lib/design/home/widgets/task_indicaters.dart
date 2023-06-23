import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../common_widgets/decoration_card.dart';

class Indicators extends StatelessWidget {
  const Indicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percentage = 0.5;
    return DecorationCard(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 3,
              percent: percentage,
              backgroundWidth: 1,
              backgroundColor: Theme.of(context).colorScheme.primary,
              center: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.battery_3_bar_rounded,
                    color: Theme.of(context).colorScheme.surface,
                  ).paddingBottom(5),
                  Text(
                    '${(percentage * 100).toStringAsFixed(0)} %',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              progressColor: Theme.of(context).colorScheme.tertiary,
            ),
          ).paddingBottom(10),
          Row(
            children: const [
              Expanded(
                child: ProgressIndicator(
                  currentStep: 5,
                  value: '480 kwh',
                  title: 'Weekly Charge',
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Expanded(
                child: ProgressIndicator(
                  currentStep: 8,
                  value: '480 kwh',
                  title: 'Monthly Charge',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  final String value;
  final int currentStep;
  final String title;

  const ProgressIndicator(
      {Key? key,
      required this.value,
      required this.currentStep,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end
      ,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start
          ,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500),
            ).paddingSymmetric(vertical: 10),
            CustomStepProgressIndicator(
              totalSteps: 20,
              currentStep: currentStep,
              stepWidth: 5,
              stepHeight: 20,
              stepPadding: 3,
              selectedColor: Theme.of(context).colorScheme.surface,
              unselectedColor: Colors.white24,
              borderRadius: BorderRadius.circular(4),
            ).paddingRight(10),
          ],
        ).paddingSymmetric(vertical: 10, horizontal: 10),
        Text(
          value,
          style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.bold),
        ).paddingRight(20),
      ],
    );
  }
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
  final Gradient gradientColor;

  const CustomStepProgressIndicator({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    this.stepWidth = 10,
    this.stepHeight = 20,
    this.stepPadding = 2,
    required this.selectedColor,
    required this.unselectedColor,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(4),
      bottomLeft: Radius.circular(4),
      topRight: Radius.circular(4),
      bottomRight: Radius.circular(4),
    ),
    this.gradientColor = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.orange, Colors.white],
    ),
  }) : super(key: key);

  @override
  CustomStepProgressIndicatorState createState() =>
      CustomStepProgressIndicatorState();
}

class CustomStepProgressIndicatorState
    extends State<CustomStepProgressIndicator> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double totalWidth = (widget.stepWidth * widget.totalSteps) +
        (widget.stepPadding * (widget.totalSteps - 1));
    return SizedBox(
      width: totalWidth,
      height: widget.stepHeight,
      child: Stack(
        children: List.generate(
          widget.totalSteps,
          (index) {
            final bool isSelected = index < widget.currentStep;
            final bool isNextSelected = index == widget.currentStep;
            final bool isRemainingUnselected = index > widget.currentStep;
            return Positioned(
              left: (widget.stepWidth + widget.stepPadding) * index,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  final double opacity = isNextSelected
                      ? _animationController.value
                      : isSelected || isRemainingUnselected
                          ? 1.0
                          : 0.0;
                  final Color color = isNextSelected
                      ? Theme.of(context).colorScheme.surface
                      : isSelected
                          ? widget.selectedColor
                          : widget.unselectedColor;
                  return Opacity(
                    opacity: opacity,
                    child: Container(
                      width: widget.stepWidth,
                      height: widget.stepHeight,
                      decoration: BoxDecoration(
                        borderRadius: widget.borderRadius,
                        color: color,
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

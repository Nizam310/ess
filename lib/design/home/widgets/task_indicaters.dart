import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Indicators extends StatelessWidget {
  const Indicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percentage = 0.5;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary,
          ]),
          width: 0.2,
        ),
      ),
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
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
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
                  text: 'With ',
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Expanded(
                child: ProgressIndicator(
                  currentStep: 2,
                  text: 'With ',
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
  final String text;
  final int currentStep;

  const ProgressIndicator(
      {Key? key, required this.text, required this.currentStep})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          Text(
            text,
            style:  TextStyle(
                color: Theme.of(context).colorScheme.surface, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ).paddingSymmetric(vertical: 10, horizontal: 10);
  }
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
  Widget build(BuildContext context) {
    final double totalWidth =
        (stepWidth * totalSteps) + (stepPadding * (totalSteps - 1));

    return SizedBox(
      width: totalWidth,
      height: stepHeight,
      child: Stack(
        children: List.generate(
          totalSteps,
          (index) {
            final bool isSelected = index < currentStep;
            return Positioned(
              left: (stepWidth + stepPadding) * index,
              child: Container(
                width: stepWidth,
                height: stepHeight,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: isSelected ? selectedColor : unselectedColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

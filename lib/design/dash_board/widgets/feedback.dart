import 'package:employee_self_service_flutter/design/common_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/button.dart';
import '../../home/home_provider.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:Theme.of(context).colorScheme.primary,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Feed Back",
              style: TextStyle(
                fontSize: 15,
              )).paddingSymmetric(vertical: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                '1',
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: 3),
              const Text(
                '2',
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: 3),
              const Text(
                '3',
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: 3),
              const Text(
                '4',
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: 3),
              const Text(
                '5',
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: 3),
            ],
          ).paddingSymmetric(
            horizontal: 0,
          ),
          Slider(
            activeColor:Theme.of(context).colorScheme.primary,
            value: context.select((HomeVm value) => value.sliderValue),
            onChanged: (onChanged) {
              context.read<HomeVm>().sliderValue = onChanged;
              context.read<HomeVm>().refresh();
            },
            min: 1,
            max: 5,
            divisions: 4,
          ).paddingSymmetric(horizontal: 0),
          Row(
            children: [
              Expanded(
                child: CusTextField(
                    maxLines: 2,
                    hintText: "Comment your feedback here..",
                    controller:
                        context.select((HomeVm value) => value.feedbackComment),
                    onChanged: (val) {}),
              ),
            ],
          ).paddingSymmetric(horizontal: 10),
          CusButton(
            text: "Sent feedback",
            onTap: () {
              context.read<HomeVm>().feedbackComment.clear();
              context.read<HomeVm>().refresh();
            },
          ).paddingSymmetric(horizontal: 10, vertical: 10),
        ],
      ),
    );
  }
}

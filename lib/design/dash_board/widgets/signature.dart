
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/decoration_card.dart';
import '../../../constant/enum.dart';

class Signature extends StatelessWidget {

  final String name;
  final CusAttendeeType type;
  final Function()? buttonOnTap;
  final String? buttonText;
  final Widget? button;
  final Widget image;
  const Signature(
      {Key? key,

      required this.name,
      required this.type,
      this.buttonOnTap,
      this.buttonText,
      this.button, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =Theme.of(context).colorScheme.surface;
    return DecorationCard(
      child: Column(
        children: [
          Text(type == CusAttendeeType.attendee
              ? 'Attendee Name : $name'
              : "Customer Name : $name",style: TextStyle(color: color),),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Signature",style: TextStyle(color: color),
            ),
          ).paddingOnly( left :20,bottom: 5),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: image.paddingSymmetric(
                    horizontal: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(vertical: 20),
    ).paddingSymmetric(horizontal: 10, vertical: 10);
  }
}

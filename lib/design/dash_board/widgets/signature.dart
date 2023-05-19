import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../enum/enum.dart';

class Signature extends StatelessWidget {
  final String link;
  final String name;
  final CusAttendeeType type;

  const Signature(
      {Key? key, required this.link, required this.name, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(type == CusAttendeeType.attendee
              ? 'Attendee Name : $name'
              : "Customer Name : $name"),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Signature",
            ),
          ).paddingLeft(20),
          Row(
            children: [
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.black)),
                  child: Image.network(
                    link,
                    height: 300,
                  ),
                ).paddingSymmetric(
                  horizontal: 10,
                ),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(vertical: 20),
    ).paddingSymmetric(horizontal: 10, vertical: 10);
  }
}

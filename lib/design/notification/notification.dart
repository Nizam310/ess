import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) => const Card(
            child: ListTile(
              shape: RoundedRectangleBorder(),
              leading: CircleAvatar(),
              title: Text("Task Assigned to you"),
              subtitle: Text("From : ${"HR"}"),
            ),
          ).paddingSymmetric(horizontal: 20, vertical: 5),
        )),
      ],
    ).paddingSymmetric(vertical: 30);
  }
}

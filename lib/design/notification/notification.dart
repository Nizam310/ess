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
          itemBuilder: (context, index) =>  Card(
            child: ListTileTheme(
              child: ExpansionTile(
                shape: const RoundedRectangleBorder(),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: const Center(child: Icon(Icons.person,size: 15,)),
                ),
                title: const Text("Task Assigned to you"),
                subtitle: const Text("From : ${"HR"}"),
                children: const [
                  Divider(),
                  SizedBox(
                      height: 100,
                      child: Text('More Details!'))
                ],
              ),
            ),
          ).paddingSymmetric(horizontal: 20, vertical: 5),
        )),
      ],
    ).paddingSymmetric(vertical: 30);
  }
}

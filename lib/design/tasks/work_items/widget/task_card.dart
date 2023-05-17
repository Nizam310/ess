import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color(0xFF3BBFC0),
          ),
          borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent, width: 0.0),
        ),
        leading: const Icon(Icons.stop_circle),
        title: const Text("Task Created"),
        trailing: const Text("00:02"),
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Started Time : 11:48 ").paddingBottom(5),
                const Text("Date : 5/17/2023").paddingBottom(5),
                const Text("Assigned To : You").paddingBottom(5),
                const Text("Description : ").paddingBottom(5),
              ],
            ),
          ).paddingSymmetric(horizontal: 10, vertical: 10),
        ],
      ),
    );
  }
}

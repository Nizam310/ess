import 'package:employee_self_service_flutter/design/tasks/task_provider.dart';
import 'package:employee_self_service_flutter/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskVm>(builder: (context, data, _) {
      return Card(
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0xFF3BBFC0),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: ListTileTheme(
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Color(0xFFFFFFFF),
              ),
              borderRadius: BorderRadius.circular(10)),
          child: ExpansionTile(
            leading: Icon(data.type == ActivityType.RecentlyCreated
                ? Icons.stop_circle
                : data.type == ActivityType.RecentlyUpdated
                    ? Icons.stop_circle
                    : data.type == ActivityType.RecentlyCompleted
                        ? null
                        : Icons.stop_circle),
            title: Text(data.type == ActivityType.RecentlyCreated
                ? "Task Created"
                : data.type == ActivityType.RecentlyCompleted
                    ? "Task Completed"
                    : data.type == ActivityType.RecentlyUpdated
                        ? "Task Updated"
                        : "Task Created"),
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
                    Text("Status : ${data.type == ActivityType.RecentlyCreated ? "To Do" : data.type == ActivityType.RecentlyCompleted ? "Done" : data.type == ActivityType.RecentlyUpdated ? "Doing" : "To Do"}")
                        .paddingBottom(5),
                    const Text("Description : ").paddingBottom(5),
                  ],
                ),
              ).paddingSymmetric(horizontal: 10, vertical: 10),
            ],
          ),
        ),
      );
    });
  }
}

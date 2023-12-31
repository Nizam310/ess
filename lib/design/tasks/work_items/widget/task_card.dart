import 'package:employee_self_service_flutter/design/tasks/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../../../constant/enum.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    const  style =  TextStyle();
    return Consumer<TaskVm>(builder: (context, data, _) {
      return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: colorScheme.outline)
          ),
        child: ListTileTheme(
          child: ExpansionTile(
            leading: Icon(
              data.type == ActivityType.RecentlyCreated
                  ? Icons.stop_circle
                  : data.type == ActivityType.RecentlyUpdated
                      ? Icons.stop_circle
                      : data.type == ActivityType.RecentlyCompleted
                          ? null
                          : Icons.stop_circle,
             // color: colorScheme.primary,
            ),
            title: Text(
              data.type == ActivityType.RecentlyCreated
                  ? "Task Created"
                  : data.type == ActivityType.RecentlyCompleted
                      ? "Task Completed"
                      : data.type == ActivityType.RecentlyUpdated
                          ? "Task Updated"
                          : "Task Created",
              style: style,
            ),
            trailing: Text("00:02", style: style),
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Started Time : 11:48 ", style: style)
                        .paddingBottom(5),
                    Text("Date : 5/17/2023", style: style).paddingBottom(5),
                    Text(
                      "Assigned To : You",
                      style: style,
                    ).paddingBottom(5),
                    Text(
                            "Status : ${data.type == ActivityType.RecentlyCreated ? "To Do" : data.type == ActivityType.RecentlyCompleted ? "Done" : data.type == ActivityType.RecentlyUpdated ? "Doing" : "To Do"}",
                            style: style)
                        .paddingBottom(5),
                    Text(
                      "Description : ",
                      style: style,
                    ).paddingBottom(5),
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

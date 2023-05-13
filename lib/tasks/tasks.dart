import 'package:employee_self_service_flutter/common_widgets/button.dart';
import 'package:employee_self_service_flutter/common_widgets/drop_down.dart';
import 'package:employee_self_service_flutter/common_widgets/text_field.dart';
import 'package:employee_self_service_flutter/tasks/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskVm>(builder: (context, data, _) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                CusTextField(
                        labelText: "Task Title",
                        controller: data.taskTitle,
                        onChanged: (val) {})
                    .paddingSymmetric(vertical: 10),
                CusDropdown<String>(
                  label: "Task Status",
                  verPadding: 5,
                  value: data.status,
                  items: data.statusList,
                  itemBuilder: (type) => Text(type),
                  onChanged: (String? value) {
                    if (value != null) {
                      data.status = value;
                    }
                    data.refresh();
                  },
                  horPadding: 0,
                ),
                CusDropdown<String>(
                  label: "Assigned To",
                  verPadding: 5,
                  value: data.assigned,
                  items: const ["You"],
                  itemBuilder: (type) => Text(type),
                  onChanged: (String? value) {
                    if (value != null) {
                      data.assigned = value;
                    }
                    data.refresh();
                  },
                  horPadding: 0,
                ),
                ListTile(
                  tileColor: data.isRunning ?Colors.transparent:Colors.blue,
                  leading: Icon(
                      data.isRunning ? Icons.stop_circle : Icons.play_circle),
                  title: Text(
                    data.isRunning ? data.timerText : "Start Tracking",
                    textAlign: TextAlign.center,
                  ).paddingRight(20),
                  onTap: () {
                    data.startStop();
                    data.refresh();
                  },
                ).paddingSymmetric(vertical: 5),
                CusTextField(
                        labelText: "Description",
                        controller: data.taskDesc,
                        maxLines: 3,
                        onChanged: (val) {})
                    .paddingSymmetric(vertical: 10),
                CusButton(text: "Save", onTap: () {})
                    .paddingSymmetric(vertical: 5),
              ],
            )
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 15),
      );
    });
  }
}

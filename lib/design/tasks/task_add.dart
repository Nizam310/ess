import 'package:employee_self_service_flutter/design/dash_board/dash_board_provider.dart';
import 'package:employee_self_service_flutter/design/tasks/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../common_widgets/button.dart';
import '../common_widgets/drop_down.dart';
import '../common_widgets/list_cus_card.dart';
import '../common_widgets/text_field.dart';

class TaskAdd extends StatelessWidget {
  const TaskAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: const _TaskAdd(),
      /* ),*/
    );
  }
}

class _TaskAdd extends StatelessWidget {
  const _TaskAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Theme.of(context).colorScheme.primary);
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
                  itemBuilder: (type) => Text(
                    type,
                    style: style,
                  ),
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
                  itemBuilder: (type) => Text(
                    type,
                    style: style,
                  ),
                  onChanged: (String? value) {
                    if (value != null) {
                      data.assigned = value;
                    }
                    data.refresh();
                  },
                  horPadding: 0,
                ),
                ListCusCard(
                   text: data.isRunning ? data.timerText : "Start Tracking",
                  textStyle: TextStyle(
                    color:  Theme.of(context)
                        .colorScheme
                        .primary,
                  ),
                  iconNeeded: true,
                  icon: data.isRunning ? Icons.stop_circle : Icons.play_circle,
                  iconColor: Theme.of(context)
                      .colorScheme
                      .primary /*data.isRunning ? Colors.black : Colors.white*/,
                  onTap: () {
                    data.startStop();
                    data.refresh();
                  },
                ).paddingSymmetric(vertical: 10),

                CusTextField(
                        labelText: "Description",
                        controller: data.taskDesc,
                        maxLines: 3,
                        onChanged: (val) {})
                    .paddingSymmetric(vertical: 10),
                CusButton(
                    text: "Save",
                    onTap: () {
                      context.read<DashBoardVm>().index = 8;
                      context.read<DashBoardVm>().refresh();
                    }).paddingSymmetric(vertical: 5),
              ],
            )
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 15),
      );
    });
  }
}

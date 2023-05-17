import 'package:employee_self_service_flutter/design/common_widgets/button.dart';
import 'package:employee_self_service_flutter/design/common_widgets/drop_down.dart';
import 'package:employee_self_service_flutter/design/dash_board/dash_board_provider.dart';
import 'package:employee_self_service_flutter/design/tasks/task_provider.dart';
import 'package:employee_self_service_flutter/design/tasks/work_items/recently_completed.dart';
import 'package:employee_self_service_flutter/design/tasks/work_items/recently_created.dart';
import 'package:employee_self_service_flutter/design/tasks/work_items/recently_updated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ListView(
        padding: const EdgeInsets.all(10),
        children: [
          CusDropdown<String>(
            label: "Work Item",
            items: context.select((TaskVm value) => value.workItemList),
            itemBuilder: (c) => Text(c),
            value: context.select((TaskVm value) => value.workItem),
            onChanged: (val) {
              if (val != null) {
                context.read<TaskVm>().workItem = val;
                context.read<TaskVm>().refresh();
              }
            },
            verPadding: 10,
            horPadding: 0,
          ),
          CusButton(
            text: "New Work Item",
            onTap: () {
              context.read<DashBoardVm>().index = 6;
              context.read<DashBoardVm>().refresh();
              context.read<TaskVm>().workItem = null;
            },
          ),
          Consumer<TaskVm>(
            builder: (context, data, _) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: data.workItem == "Recently Completed"
                            ? const RecentlyCompleted()
                            : data.workItem == "Recently Updated"
                                ? const RecentlyUpdated()
                                : data.workItem == "Recently Created"
                                    ? const RecentlyCreated()
                                    : const RecentlyCreated())
                  ],
                ),
              );
            },
          ).paddingSymmetric(vertical: 10),
        ],
      );
    });
  }
}

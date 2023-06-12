import 'package:employee_self_service_flutter/design/common_widgets/button.dart';
import 'package:employee_self_service_flutter/design/common_widgets/drop_down.dart';
import 'package:employee_self_service_flutter/design/dash_board/dash_board_provider.dart';
import 'package:employee_self_service_flutter/design/tasks/task_provider.dart';
import 'package:employee_self_service_flutter/design/tasks/work_items/actitvity_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../constant/enum.dart';

class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ListView(
        padding: const EdgeInsets.all(10),
        children: [
          CusDropdown<ActivityType>(
            label: "Work Item",
            items: ActivityType.values,
            itemBuilder: (c) => Text(c.name,style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
            value: context.select((TaskVm value) => value.type),
            onChanged: (val) {
              if (val != null) {
                context.read<TaskVm>().type = val;
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
              context.read<TaskVm>().type = null;
            },
          ),
          Consumer<TaskVm>(
            builder: (context, data, _) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Expanded(child: ActivityScreen())],
                ),
              );
            },
          ).paddingSymmetric(vertical: 10),
        ],
      );
    });
  }
}

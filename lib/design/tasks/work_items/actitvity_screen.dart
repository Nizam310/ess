import 'package:employee_self_service_flutter/design/tasks/work_items/widget/task_card.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../task_provider.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<TaskVm>(
      builder: (context,data,_) {
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) =>
              const TaskCard().paddingSymmetric(vertical: 10),
        );
      }
    );
  }
}

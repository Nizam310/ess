import 'package:employee_self_service_flutter/design/tasks/work_items/widget/task_card.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class RecentlyUpdated extends StatelessWidget {
  const RecentlyUpdated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) =>
          const TaskCard().paddingSymmetric(vertical: 10),
    );
  }
}

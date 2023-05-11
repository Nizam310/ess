import 'package:employee_self_service_flutter/common_widgets/text_field.dart';
import 'package:employee_self_service_flutter/leave_form/leave_form_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LeaveForm extends StatelessWidget {
  const LeaveForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LeaveFormVm(),
      child: Consumer<LeaveFormVm>(builder: (context, data, _) {
        return Column(
          children: [CusTextField(controller: data.reason, onChanged: (val) {})],
        );
      }),
    );
  }
}

import 'package:employee_self_service_flutter/common_widgets/button.dart';
import 'package:employee_self_service_flutter/common_widgets/text_field.dart';
import 'package:employee_self_service_flutter/leave_form/leave_form_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class LeaveForm extends StatelessWidget {
  const LeaveForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LeaveFormVm(),
      child: Consumer<LeaveFormVm>(builder: (context, data, _) {
        return Column(
          children: [
            CusTextField(
              controller: data.days,
              onChanged: (val) {},
              hintText: "How many days are you taking?",
            ).paddingSymmetric(horizontal: 10, vertical: 10),CusTextField(
              controller: data.reason,
              onChanged: (val) {},
              maxLines: 3,
              hintText: "Reason",
            ).paddingSymmetric(horizontal: 10, vertical: 10),
            CusButton(text: "Apply", onTap: (){},
              color: const Color(0xFF555557),
              textColor: CupertinoColors.white,
              textSize: 13,).paddingSymmetric(horizontal: 10, vertical: 10),
          ],
        ).paddingSymmetric(vertical: 10);
      }),
    );
  }
}

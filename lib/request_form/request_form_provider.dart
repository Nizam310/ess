import 'package:employee_self_service_flutter/enum/enum.dart';
import 'package:flutter/material.dart';

class RequestFormVm extends ChangeNotifier {
  TextEditingController reason = TextEditingController();
  TextEditingController days = TextEditingController();
  TextEditingController other = TextEditingController();
  String? leaveType;
  String? certifyType;
  List<String> leaveList = <String>["Medical", "Casual", "Other"];
  List<String> certificateTypeList = <String>[
    "Experience",
    "Salary Slip",
    "Other"
  ];
  RequestType? type;
  refresh() {
    notifyListeners();
  }
}

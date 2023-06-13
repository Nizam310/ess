import 'package:flutter/material.dart';

import '../../constant/enum.dart';

class RequestFormVm extends ChangeNotifier {
  TextEditingController reason = TextEditingController();
  TextEditingController days = TextEditingController();
  TextEditingController other = TextEditingController();
  String? leaveType;
  String? certifyType;
  List<String> leaveTypeList = <String>["Sick", "Annual","Paternity","Maternity","Hajj", "Other"];
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

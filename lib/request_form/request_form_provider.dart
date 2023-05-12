import 'package:employee_self_service_flutter/enum/enum.dart';
import 'package:flutter/material.dart';

class RequestFormVm extends ChangeNotifier{
  TextEditingController reason = TextEditingController();
  TextEditingController days = TextEditingController();
  TextEditingController otherLeave = TextEditingController();
  String? leaveType;
  List<String> leaveList =<String>[
    "Medical","Casual","Other"
  ];
  RequestType? type;
  refresh(){
    notifyListeners();
  }
}
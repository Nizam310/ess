import 'package:employee_self_service_flutter/home/home_page.dart';
import 'package:flutter/foundation.dart';

import '../leave_form/leave_form.dart';
import '../profile/profile.dart';
import '../settings/settings.dart';

class DashBoardVm extends ChangeNotifier {
  bool hover = false;
  int index = 0;

  final List screen = const [
    Home(),
    Profile(),
    LeaveForm(),
    Settings(),
  ];

  refresh() {
    notifyListeners();
  }
}

import 'package:employee_self_service_flutter/design/documents/documents_summary.dart';
import 'package:employee_self_service_flutter/design/notification/notification.dart';
import 'package:employee_self_service_flutter/design/request_history/request_history.dart';
import 'package:flutter/foundation.dart';

import '../attendance_history/attendance_history.dart';
import '../chat_page/chat_page.dart';
import '../clocking/clocking.dart';
import '../documents/documents.dart';
import '../employee_dash/employee_dash.dart';
import '../home/new_home.dart';
import '../pay_roll/pay_roll.dart';
import '../profile/profile.dart';
import '../request_leave/request_leave.dart';
import '../settings/settings.dart';
import '../tasks/task_add.dart';
import '../tasks/task_main.dart';
import '../tasks/task_summary.dart';
import '../team_approvals/team_approvals.dart';
import '../who_iS_off/who_is_off.dart';

class DashBoardVm extends ChangeNotifier {
  bool hover = false;
  int index = 0;

  final List screen = const [
    // Home(),

    NewHome(),
    Profile(),
    Tasks(),
    RequestLeave(),
    ChatPage(),
    Settings(),
    TaskAdd(),
    Notifications(),
    RequestHistory(),
    TeamApprovals(),
    Clocking(),
    WhoIsOff(),
    PayRoll(),
    AttachDocuments(),
    AttendanceHistory(),
    TaskSummary(),
    DocumentsSummary(),
    EmployeeDash(),
  ];

  refresh() {
    notifyListeners();
  }
}

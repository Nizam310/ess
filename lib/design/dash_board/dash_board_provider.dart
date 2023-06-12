import 'package:employee_self_service_flutter/design/notification/notification.dart';
import 'package:flutter/foundation.dart';

import '../chat_page/chat_page.dart';
import '../clocking/clocking.dart';
import '../feedback_and_signature/feedback_and_signature.dart';
import '../home/new_home.dart';
import '../profile/profile.dart';
import '../request_form/request_form.dart';
import '../settings/settings.dart';
import '../tasks/task_add.dart';
import '../tasks/task_main.dart';
import '../team_approvals/team_approvals.dart';

class DashBoardVm extends ChangeNotifier {
  bool hover = false;
  int index = 0;

  final List screen = const [
    NewHome(),
    // Home(),
    Profile(),
    Tasks(),
    RequestForm(),
    ChatPage(),
    Settings(),
    TaskAdd(),
    Notifications(),
    FeedBackAndSignature(),
    TeamApprovals(),
    Clocking(),
  ];

  refresh() {
    notifyListeners();
  }
}

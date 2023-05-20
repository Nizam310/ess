import 'package:employee_self_service_flutter/design/notification/notification.dart';
import 'package:flutter/foundation.dart';

import '../chat_page/chat_page.dart';
import '../home/home_page.dart';
import '../profile/profile.dart';
import '../request_form/request_form.dart';
import '../settings/settings.dart';
import '../tasks/task_add.dart';
import '../tasks/task_main.dart';

class DashBoardVm extends ChangeNotifier {
  bool hover = false;
  int index = 0;

  final List screen = const [
    Home(),
    Profile(),
    RequestForm(),
    Settings(),
    ChatPage(),
    Tasks(),
    TaskAdd(),
    Notifications(),
  ];

  refresh() {
    notifyListeners();
  }
}

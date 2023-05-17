import 'dart:async';

import 'package:employee_self_service_flutter/design/tasks/work_items/recently_completed.dart';
import 'package:employee_self_service_flutter/design/tasks/work_items/recently_created.dart';
import 'package:employee_self_service_flutter/design/tasks/work_items/recently_updated.dart';
import 'package:flutter/cupertino.dart';

class TaskVm extends ChangeNotifier {
  ///Task

  String? workItem;
  List<String> workItemList = [
    "Recently Completed",
    "Recently Updated",
    "Recently created"
  ];

  int activeIndex =0;

  List activityList =const [
    RecentlyCompleted(),
    RecentlyUpdated(),
    RecentlyCreated(),
  ];

  /// Task Add
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskDesc = TextEditingController();
  String? status;
  String? assigned;
  List<String> statusList = <String>[
    "To do",
    "Doing",
    "Done",
  ];

  int counter = 0;
  Timer? timer;
  bool isRunning = false;

  startStop() {
    if (isRunning) {
      timer?.cancel();
      counter = 0;
      isRunning = false;
      notifyListeners();
    } else {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        counter++;
        isRunning = true;
        notifyListeners();
      });
    }
    notifyListeners();
  }

  String get timerText {
    int minutes = counter ~/ 60;
    int seconds = counter % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  refresh() {
    notifyListeners();
  }
}

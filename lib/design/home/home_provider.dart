import 'package:employee_self_service_flutter/constant/themes/theme.dart';
import 'package:flutter/material.dart';

import '../../constant/enum.dart';

class HomeVm extends ChangeNotifier {
  bool taskManagement = false;
  bool hover = false;

  double sliderValue = 5;

  TextEditingController feedbackComment = TextEditingController();

  refresh() {
    notifyListeners();
  }



  List<Map<String, dynamic>> list(context) {
    final theme = ThemeNotifier.of(context,listen: false);
    return [
      {
        'leaveType': 'Casual leave',
        'takenLeaves': '18',
        'totalLeaves': '20',
        'emoji': 'assets/animations/casual.json',
        'emojiSize': 100.0,
      },
      {
        'leaveType': 'Annual leave',
        'takenLeaves': '18',
        'totalLeaves': '20',
        'emoji': 'assets/animations/annual_leave.json',
        'emojiSize': 60.0,
      },
      {
        'leaveType': 'Sick leave',
        'takenLeaves': '18',
        'totalLeaves': '20',
        'emoji': 'assets/animations/sick_emoji.json',
        'emojiSize': 60.0,
      },
      {
        'leaveType': 'Emergency leave',
        'takenLeaves': '18',
        'totalLeaves': '20',
        'emoji': theme.themeMode == ThemeModeType.light
            ? 'assets/animations/emergency.json'
            : 'assets/animations/emergency_dark.json',
        'emojiSize': 90.0,
      },
    ];
  }
  HomeVm(){

  }
}

import 'package:flutter/cupertino.dart';

class WhoIsOffVm extends ChangeNotifier {
  final List<Map<String, dynamic>> list = [
    {
      'name': 'Nisam',
      'position': 'Flutter Developer',
      'leaveType': 'Annual Vacation',
      'emoji': '✈️',
    },
    {
      'name': 'Shaneef',
      'position': 'View.Js Developer',
      'leaveType': 'Sick leave',
      'emoji': '🤒',
    },
    {
      'name': 'Rushaid',
      'position': 'Laravel Developer',
      'leaveType': 'Work from home',
      'emoji': '🏚️',
    },
  ];
}

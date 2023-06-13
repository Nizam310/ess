import 'package:flutter/material.dart';

class ClockingVm extends ChangeNotifier{
  final List<Map> list = [
    {
      'title': 'Clock-in',
      'value': '09:30:21 AM',
    },
    {
      'title': 'Smoke break start',
      'value': '__ : __',
    },
    {
      'title': 'Smoke break end',
      'value': '__ : __',
    },
    {
      'title': 'Clock-out',
      'value': '__ : __',
    },
  ];
}
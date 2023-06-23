import 'package:flutter/material.dart';

class ClockingVm extends ChangeNotifier{
  final List<Map> list = [
    {
      'title': 'Clock-in',
      'value': '09:30:21 AM',
    },
    {
      'title': 'break in',
      'value': '__ : __',
    },
    {
      'title': 'break out',
      'value': '__ : __',
    },
    {
      'title': 'Clock-out',
      'value': '__ : __',
    },
  ];
}
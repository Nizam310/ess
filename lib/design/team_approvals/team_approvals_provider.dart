import 'package:flutter/material.dart';

import '../../constant/enum.dart';

class TeamApprovalsVm extends ChangeNotifier{

  List<Map<String,dynamic>> approvalList = [
    {
      "name":"Beatrix Mike",
      "position":"sr.ux Designer",
      "dateFrom":"Oct 16",
      "dateTo":"Oct 18",
      "totalDates":"2",
      "content":"Going to Mt,Fuji to visit a friend in Japan will be back on october 18 at 12:00 PM in the afternoon will bring some treats!",
      "leaveType":"Annual Leave",
      'status': AttendanceRequest.Pending.name,
      "btd":"15.50 days",
      "bty":"24.12 days",
      "deductBalance":true,
    },
    {
      "name":"Beatrix Mike",
      "position":"sr.ux Designer",
      "dateFrom":"Oct 16",
      "dateTo":"Oct 18",
      "totalDates":"2",
      "content":"Going to Mt,Fuji to visit a friend in Japan will be back on october 18 at 12:00 PM in the afternoon will bring some treats!",
      "leaveType":"Annual Leave",
      'status': AttendanceRequest.Pending.name,
      "btd":"15.50 days",
      "bty":"24.12 days",
      "deductBalance":true,
    },
    {
      "name":"Beatrix Mike",
      "position":"sr.ux Designer",
      "dateFrom":"Nov 16",
      "dateTo":"Nov 18",
      "totalDates":"2",
      "content":"Going to India to visit a friend in India, will be back on october 18 at 12:00 PM in the afternoon will bring some treats!",
      "leaveType":"Haj Leave",
      'status': AttendanceRequest.Approved.name,
      "btd":"10.50 days",
      "bty":"20.12 days",
      "deductBalance":false,
    },{
      "name":"Beatrix Mike",
      "position":"sr.ux Designer",
      "dateFrom":"Nov 16",
      "dateTo":"Nov 18",
      "totalDates":"2",
      "content":"Going to India to visit a friend in India, will be back on october 18 at 12:00 PM in the afternoon will bring some treats!",
      "leaveType":"Haj Leave",
      'status': AttendanceRequest.Rejected.name,
      "btd":"10.50 days",
      "bty":"20.12 days",
      "deductBalance":false,
    },{
      "name":"Beatrix Mike",
      "position":"sr.ux Designer",
      "dateFrom":"Nov 16",
      "dateTo":"Nov 18",
      "totalDates":"2",
      "content":"Going to India to visit a friend in India, will be back on october 18 at 12:00 PM in the afternoon will bring some treats!",
      "leaveType":"Haj Leave",
      'status': AttendanceRequest.Rejected.name,
      "btd":"10.50 days",
      "bty":"20.12 days",
      "deductBalance":false,
    },
  ];
  refresh(){
    notifyListeners();
  }
}

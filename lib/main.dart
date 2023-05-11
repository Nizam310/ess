import 'package:employee_self_service_flutter/home/home_page.dart';
import 'package:employee_self_service_flutter/login/login_screen.dart';
import 'package:flutter/material.dart';

import 'dash_board/dash_board_screen.dart';
import 'leave_form/leave_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Self Service',
      theme: ThemeData(),
      routes: {
        '/': (context) => const LoginScreen(),
        '/dash': (context) => const DashBoard(),
        '/home': (context) => const Home(),
        '/profile': (context) => const DashBoard(),
        '/leave': (context) => const LeaveForm(),
      },
    );
  }
}

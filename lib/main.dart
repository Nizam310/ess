import 'package:employee_self_service_flutter/design/profile/profile.dart';
import 'package:employee_self_service_flutter/design/request_form/request_form.dart';
import 'package:flutter/material.dart';

import 'constant/theme.dart';
import 'design/dash_board/dash_board_screen.dart';
import 'design/home/home_page.dart';
import 'design/login/login_screen.dart';

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
      theme: Themes.lightTheme(),
      routes: {
        '/': (context) => const LoginScreen(),
        '/dash': (context) => const DashBoard(),
        '/home': (context) => const Home(),
        '/profile': (context) => const Profile(),
        '/leave': (context) => const RequestForm(),
      },
    );
  }
}


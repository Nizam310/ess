import 'package:employee_self_service_flutter/design/profile/profile.dart';
import 'package:employee_self_service_flutter/design/request_form/request_form.dart';
import 'package:flutter/material.dart';

import 'dash_board/dash_board_screen.dart';
import 'home/home_page.dart';
import 'login/login_screen.dart';


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
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[40],
          listTileTheme: ListTileThemeData(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.grey.shade400, width: 0.5)),
          )),
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

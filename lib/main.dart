import 'package:employee_self_service_flutter/design/profile/profile.dart';
import 'package:employee_self_service_flutter/design/request_form/request_form.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[40],
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color(0xFF3BBFC0),
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: const TextStyle(color: Colors.black),
              hintStyle: const TextStyle(color: Colors.red),
              floatingLabelStyle: const TextStyle(color: Colors.black),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFF3BBFC0),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFF3BBFC0),
                  )),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFF3BBFC0),
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFF3BBFC0),
                  )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFF3BBFC0),
                  ))),
          listTileTheme: ListTileThemeData(
            //  tileColor: Colors.white,
            iconColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Color(0xFF3BBFC0),
                )),
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

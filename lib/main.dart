import 'dart:ui';

import 'package:employee_self_service_flutter/design/profile/profile.dart';
import 'package:employee_self_service_flutter/design/request_form/request_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/init_meedu_player.dart';

import 'constant/enum.dart';
import 'constant/themes/theme.dart';
import 'design/dash_board/dash_board_screen.dart';
import 'design/home/home_page.dart';
import 'design/login/login_screen.dart';

void main() {
  initMeeduPlayer();
  runApp(const ThemeNotifier(child: MyApp()));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeNotifier.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Employee Self Service',
      theme: Themes.lightTheme(context),
      darkTheme: Themes.darkTheme(context),
      themeMode: themeProvider.themeMode == ThemeModeType.light
          ? ThemeMode.light
          : ThemeMode.dark,
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


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
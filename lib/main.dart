import 'dart:ui';

import 'package:employee_self_service_flutter/design/notification/notification.dart';
import 'package:employee_self_service_flutter/design/profile/profile.dart';
import 'package:employee_self_service_flutter/design/tasks/task_main.dart';
import 'package:employee_self_service_flutter/design/team_approvals/team_approvals.dart';
import 'package:flutter/material.dart';

import 'constant/enum.dart';
import 'constant/themes/theme.dart';
import 'design/dash_board/dash_board_screen.dart';
import 'design/home/home_page.dart';
import 'design/login/login_screen.dart';
import 'design/request_leave/request_leave.dart';

void main() {

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
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/dash': (context) => const DashBoard(),
        '/home': (context) => const Home(),
        '/profile': (context) => const Profile(),
        '/leave': (context) => const RequestLeave(),
        '/notify': (context) => const Notifications(),
        '/task': (context) => const Tasks(),
        '/approvals': (context) => const TeamApprovals(),
      },
     /* navigatorObservers: [
        CustomRouteObserver(),
      ],*/
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

class CustomRouteObserver extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // Check if the current route is the login page
    if (previousRoute?.settings.name == '/') {
      // Prevent auto logout by removing the login route from the history
      final navigator = route.navigator;
      navigator?.removeRoute(route);
    }

    super.didPop(route, previousRoute);
  }
}
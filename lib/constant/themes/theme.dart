import 'package:employee_self_service_flutter/constant/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors.dart';

class Themes {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        colorScheme: ColorSchemes.light,
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        )),
        listTileTheme: ListTileThemeData(
          iconColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.primary,
              )),
        ),
      inputDecorationTheme:  InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color:
                Theme.of(context).colorScheme.primary)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color:
                Theme.of(context).colorScheme.primary)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color:
                Theme.of(context).colorScheme.primary)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color:
              Theme.of(context).colorScheme.error),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color:
                Theme.of(context).colorScheme.primary)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color:
                Theme.of(context).colorScheme.primary)),

      ),);
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
        colorScheme: ColorSchemes.dark,
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        )),
        listTileTheme: ListTileThemeData(
          iconColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.primary,
              )),
        ),
    inputDecorationTheme:  InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.primary)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.primary)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.primary)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color:
              Theme.of(context).colorScheme.error),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.primary)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.primary)),

    ),
    );
  }
}

class ThemeNotifier extends StatelessWidget {
  final Widget child;

  const ThemeNotifier({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: child,
    );
  }

  static ThemeProvider of(BuildContext context, {bool listen = true}) {
    final provider = Provider.of<ThemeProvider>(context, listen: listen);
    return provider;
  }
}

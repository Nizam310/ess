import 'package:flutter/material.dart';

import 'colors.dart';

class Themes {
  static ThemeData lightTheme() {
    return ThemeData(
        scaffoldBackgroundColor: Colors.grey[40],
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: ColorS.primary,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: const TextStyle(color: Colors.black),
            hintStyle: TextStyle(color: ColorS.error),
            floatingLabelStyle: const TextStyle(color: Colors.black),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorS.primary,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorS.primary,
                )),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorS.primary,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorS.primary,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorS.primary,
                ))),
        bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        )),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: ColorS.primary,
              )),
        ));
  }
}

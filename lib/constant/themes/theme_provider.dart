import 'package:flutter/material.dart';

import '../enum.dart';

class ThemeProvider with ChangeNotifier {
  ThemeModeType _themeMode = ThemeModeType.dark;

  ThemeModeType get themeMode => _themeMode;

  void toggleThemeMode() {
    _themeMode = _themeMode == ThemeModeType.dark
        ? ThemeModeType.light
        : ThemeModeType.dark;
    notifyListeners();
  }
}

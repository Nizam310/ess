import 'package:flutter/material.dart';

class ColorSchemes {

  /// The Light And Dark Color Schemes Are defines here if you want to change the theme of the ESS
  /// simply change the color schemes

  /// Light
  static const ColorScheme light = ColorScheme.light(
    primary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFFFFF),
    onPrimary: Color(0xFF000000),
    onPrimaryContainer: Color(0xFFFFFFFF),
    secondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF),
    onSecondaryContainer: Color(0xFF),
    tertiary: Color(0xFF37E813),
    tertiaryContainer: Color(0xFF),
    onTertiary: Color(0xFF),
    onTertiaryContainer: Color(0xFF),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF),
    background: Color(0xFF1F2050),
    onBackground: Color(0xFF),
    error: Color(0xFFF44336),
    errorContainer: Color(0xFFF44336),
    onError: Color(0xFFF44336),
    onErrorContainer: Color(0xFFF44336),
    shadow: Color(0xFF000000),
  );

  /// Dark
  static const ColorScheme dark = ColorScheme.dark(
    primary: Color(0xFF3C89B9),
    primaryContainer: Color(0xFF1B425D),
    onPrimary: Color(0xFF3C89B9),
    onPrimaryContainer: Color(0xFF485F70),
    secondary: Color(0xFF37E813),
    secondaryContainer: Color(0xFF24561B),
    onSecondary: Color(0xFF598850),
    onSecondaryContainer: Color(0xFF35622C),
    tertiary: Color(0xFFB70CF6),
    tertiaryContainer: Color(0xFF6B4679),
    onTertiary: Color(0xFF6D437C),
    onTertiaryContainer: Color(0xFF260A31),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFFFFFFFF),
    background: Color(0xFF070A24),
    onBackground: Color(0xFF242A60),
    error: Color(0xFFF44336),
    errorContainer: Color(0xFFF44336),
    onError: Color(0xFFF44336),
    onErrorContainer: Color(0xFFF44336),
    shadow: Color(0xFF000000),
  );
}

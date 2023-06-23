import 'package:flutter/material.dart';

class ColorSchemes {
  /// The Light And Dark Color Schemes Are defines here if you want to change the theme of the ESS
  /// simply change the color schemes

  /// Light
  static const ColorScheme light = ColorScheme.light(
      primary: Color(0xFF00CDCA),
      onPrimary: Color(0xFF3F3F41),
      primaryContainer: Color(0xFF00CDCA),
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
      background: Color(0xFFF6F9FC),
      onBackground: Color(0xFF),
      error: Color(0xFFF44336),
      errorContainer: Color(0xFFF44336),
      onError: Color(0xFFF44336),
      onErrorContainer: Color(0xFFF44336),
      shadow: Color(0xFF000000),
      outline: Color(0xFF00CDCA),
      outlineVariant: Color(0xFF3A3434),
      inversePrimary: Color(0xFF000000),
      inverseSurface:  Color(0xFFFFFFFF),
  );

  /// Dark
  static const ColorScheme dark = ColorScheme.dark(
      primary: Color(0xFF00CDCA),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF000000),
      onPrimaryContainer: Color(0xFF485F70),
      secondary: Color(0xFF303030),
      secondaryContainer: Color(0xFF24561B),
      onSecondary: Color(0xFF598850),
      onSecondaryContainer: Color(0xFF35622C),
      tertiary: Color(0xFF37E813),
      tertiaryContainer: Color(0xFF6B4679),
      onTertiary: Color(0xFF6D437C),
      onTertiaryContainer: Color(0xFF260A31),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFFFFFFFF),
      background: Color(0xFF303030),
      onBackground: Color(0xFF242A60),
      error: Color(0xFFF44336),
      errorContainer: Color(0xFFF44336),
      onError: Color(0xFFF44336),
      onErrorContainer: Color(0xFFF44336),
      shadow: Color(0xFF000000),
      outline: Color(0xFFFFFFFF),
      outlineVariant: Color(0xFF9F9898),
      inversePrimary: Color(0xFF34779D),
      inverseSurface: Color(0xFF000000),

  );
}

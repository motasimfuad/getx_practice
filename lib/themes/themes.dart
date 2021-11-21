import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      onPrimary: Colors.white,
    ),
  ).copyWith(
    primaryColor: Colors.deepPurple,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurple,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.deepPurple,
    ),
  );
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(),
  );
}

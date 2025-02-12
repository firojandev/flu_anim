import 'package:flutter/material.dart';

import 'my_colors.dart';
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorSchemeSeed: MyColors.primaryColor,
    brightness: Brightness.light,
    useMaterial3: true, // Enables Material 3
  );

  static final ThemeData darkTheme = ThemeData(
    colorSchemeSeed: MyColors.primaryColor,
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}

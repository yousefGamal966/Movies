import 'dart:ui';

import 'package:flutter/material.dart';

class MyThemeData{
  static Color backgroundColor = Color(0xFF1E1E1E);
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    primaryColor: backgroundColor,
    scaffoldBackgroundColor: backgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
elevation: 30,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(size: 32)

    )
  );
}
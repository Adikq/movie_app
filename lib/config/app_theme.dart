import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme() => ThemeData(
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          displaySmall: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          displayMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600, color: Colors.white
          ),
          displayLarge: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      );
}

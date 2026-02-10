import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryColor = Color(0xFF000000);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _primaryColor,
      textTheme: const TextTheme(
        labelSmall: TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        )
      ),
      inputDecorationTheme: const InputDecorationTheme(
          border:  OutlineInputBorder(),
        )
      );
  }
}
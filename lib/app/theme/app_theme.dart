import 'package:flutter/material.dart';

class AppTheme {
  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF0F1115),
    cardColor: const Color(0xFF1A1D24),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0F1115),
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      secondary: Colors.teal,
      surface: Color(0xFF1A1D24),
    ),
  );

  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color(0xFFF6F7FB),
    cardColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0.5,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.teal,
      surface: Colors.white,
    ),
  );
}
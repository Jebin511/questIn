import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xFF0F1B2A),
      fontFamily: 'Pixel',
      colorScheme: ColorScheme.dark(
        primary: Color(0xFFFFC107),
        secondary: Color(0xFF29B6F6),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1F2A44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.white, width: 3),
        ),
        elevation: 8,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFFC107),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        )
      ),
    );
  }
}

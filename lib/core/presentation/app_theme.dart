import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(64, 51, 41, 1),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 30,
    ),
    fontFamily: GoogleFonts.lobsterTwo().fontFamily,
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      headlineMedium: TextStyle(
          color: Color.fromRGBO(64, 51, 41, 1),
          fontSize: 30,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        color: Color.fromRGBO(64, 51, 41, 1),
        fontSize: 17,
      ),
    ),
  );
}

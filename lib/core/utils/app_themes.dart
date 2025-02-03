import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  // Light Theme
  static ThemeData getLightTheme({required bool isArabic}) {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      brightness: Brightness.light,
      textTheme: isArabic
          ? GoogleFonts.tajawalTextTheme() // Arabic font
          : GoogleFonts.interTextTheme(), // English font
    );
  }

  // Dark Theme
  static ThemeData getDarkTheme({required bool isArabic}) {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFF121212),
      brightness: Brightness.dark,
      textTheme: isArabic
          ? GoogleFonts.tajawalTextTheme() // Arabic font
          : GoogleFonts.interTextTheme(), // English font
    );
  }
}

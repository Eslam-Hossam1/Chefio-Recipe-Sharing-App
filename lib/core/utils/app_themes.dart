import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  // Light Theme
  static ThemeData getLightTheme({required bool isArabic}) {
    return ThemeData(
      dialogBackgroundColor: const Color(0xFFF0F0F0),
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1FCC79)),

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
      dialogBackgroundColor: const Color(0xFF1E1E1E),
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E8C6C),brightness: Brightness.dark),
      scaffoldBackgroundColor: const Color(0xFF121212),
      brightness: Brightness.dark,
      textTheme: isArabic
          ? GoogleFonts.tajawalTextTheme() // Arabic font
          : GoogleFonts.interTextTheme(), // English font
    );
  }
}

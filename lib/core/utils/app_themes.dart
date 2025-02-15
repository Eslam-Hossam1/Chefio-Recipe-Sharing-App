import 'package:chefio_app/core/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  // Light Theme
  static ThemeData getLightTheme({required TextTheme textTheme}) {
    return ThemeData(
      dialogBackgroundColor: const Color(0xFFF0F0F0),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      textTheme: textTheme,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF1FCC79),
        secondary: Color(0xFFFF6464),
        onSurfaceVariant: Color(0xFF9FA5C0),
        outline: Color(0xFFD0DBEA),
      ),
      extensions: <ThemeExtension<dynamic>>[
        CustomColors(
          mainTextColor: const Color(0xFF2E3E5C),
          secondaryTextColor: const Color(0xFF9FA5C0),
        ),
      ],
    );
  }

  // Dark Theme
  static ThemeData getDarkTheme({required TextTheme textTheme}) {
    return ThemeData(
      dialogBackgroundColor: const Color(0xFF1E1E1E),
      scaffoldBackgroundColor: const Color(0xFF121212),
      colorScheme: ColorScheme.dark(
        primary: Color(0xFF1E8C6C),
        secondary: Color(0xFFE74C3C),
        onSurfaceVariant: Color(0xFFB0BEC5),
        outline: Color(0xFF3C3C3C),
      ),
      brightness: Brightness.dark,
      textTheme: textTheme,
      extensions: <ThemeExtension<dynamic>>[
        CustomColors(
          mainTextColor: const Color(0xFFECEFF4),
          secondaryTextColor: const Color(0xFFB0BEC5),
        ),
      ],
    );
  }
}

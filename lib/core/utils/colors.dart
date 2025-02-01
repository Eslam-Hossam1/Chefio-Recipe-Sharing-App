import 'package:flutter/material.dart';

abstract class AppColors {
  static Color getPrimaryColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark
        ? const Color(0xFF1E8C6C)
        : const Color(0xFF1FCC79);
  }

  static Color getSecondaryColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark
        ? const Color(0xFFE74C3C)
        : const Color(0xFFFF6464);
  }

  static Color getMainTextColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark
        ? const Color(0xFFECEFF4)
        : const Color(0xFF2E3E5C);
  }

  static Color getSecondaryTextColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark
        ? const Color(0xFFB0BEC5)
        : const Color(0xFF9FA5C0);
  }

  static Color getOutlineColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark
        ? const Color(0xFF3C3C3C)
        : const Color(0xFFD0DBEA);
  }

  static Color getFormColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark
        ? const Color(0xFF2E2E2E)
        : const Color(0xFFF4F5F7);
  }

  static Color getScaffoldBackgroundColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark
        ? const Color(0xFF121212)
        : const Color(0xFFFFFFFF);
  }

  static Color getAwesomeDialogBackgroundColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark
        ? const Color(0xFF1E1E1E)
        : const Color(0xFFF0F0F0);
  }
}

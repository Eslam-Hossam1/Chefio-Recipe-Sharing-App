import 'package:chefio_app/core/theme/app_colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

abstract class SystemUIHelper {
  static void setSystemUIForTheme(
    BuildContext context,
    ThemeMode mode,
  ) {
    switch (mode) {
      case ThemeMode.system:
        _setSystemUIForSystemTheme(context);
        break;
      case ThemeMode.light:
        _setSystemUIForLightTheme();
        break;
      case ThemeMode.dark:
        _setSystemUIForDarkTheme();
        break;
    }
  }

  static _setSystemUIForLightTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.lightScaffoldBackground,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  static _setSystemUIForDarkTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.darkScaffoldBackground,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static _setSystemUIForSystemTheme(BuildContext context) {
    final Brightness platformBrightness =
        MediaQuery.of(context).platformBrightness;
    switch (platformBrightness) {
      case Brightness.dark:
        _setSystemUIForDarkTheme();
        break;
      case Brightness.light:
        _setSystemUIForLightTheme();
        break;
    }
  }
}

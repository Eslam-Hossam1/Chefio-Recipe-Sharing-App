import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/models/theme_mode_option.dart';
import 'package:flutter/material.dart';

abstract class AppThemeOptions {
  static final ThemeModeOption light = ThemeModeOption(
    name: 'Light',
    localizationKey: AppLocalizationKeys.themes.light,
    icon: Icons.light_mode,
    themeMode: ThemeMode.light,
  );

  static final ThemeModeOption dark = ThemeModeOption(
    name: 'Dark',
    localizationKey: AppLocalizationKeys.themes.dark,
    icon: Icons.dark_mode,
    themeMode: ThemeMode.dark,
  );

  static final ThemeModeOption system = ThemeModeOption(
    name: 'System',
    localizationKey: AppLocalizationKeys.themes.system,
    icon: Icons.settings_suggest,
    themeMode: ThemeMode.system,
  );

  static final List<ThemeModeOption> supportedThemes = [
    light,
    dark,
    system,
  ];

  static ThemeModeOption getThemeModeOptionFromThemeMode(ThemeMode themeMode) {
    return supportedThemes.firstWhere(
      (option) => option.themeMode == themeMode,
      orElse: () => system, // Default to system if not found
    );
  }
}

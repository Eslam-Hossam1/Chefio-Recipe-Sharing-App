import 'package:chefio_app/core/utils/theme/app_colors.dart';
import 'package:chefio_app/core/utils/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    dialogBackgroundColor: AppColors.lightDialogBackground,
    scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      onSurfaceVariant: AppColors.lightOnSurfaceVariant,
      outline: AppColors.lightOutline,
    ),
    extensions: <ThemeExtension<dynamic>>[
      CustomColors(
        mainTextColor: AppColors.lightMainTextColor,
        secondaryTextColor: AppColors.lightSecondaryTextColor,
        formColor: AppColors.lightFormColor,
        toastColor: AppColors.lightToastBackground,
        cachedNetworkImagePlaceholderColor:
            AppColors.lightCachedNetworkImagePlacholderColor,
      ),
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    dialogBackgroundColor: AppColors.darkDialogBackground,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
      onSurfaceVariant: AppColors.darkOnSurfaceVariant,
      surface: AppColors.darkSurface,
      outline: AppColors.darkOutline,
    ),
    brightness: Brightness.dark,
    extensions: <ThemeExtension<dynamic>>[
      CustomColors(
        mainTextColor: AppColors.darkMainTextColor,
        secondaryTextColor: AppColors.darkSecondaryTextColor,
        formColor: AppColors.darkFormColor,
        toastColor: AppColors.darkToastBackground,
        cachedNetworkImagePlaceholderColor:
            AppColors.darkCachedNetworkImagePlacholderColor,
      ),
    ],
  );
}

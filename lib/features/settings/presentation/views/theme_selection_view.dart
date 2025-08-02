import 'package:chefio_app/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/app_theme_options.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSelectionView extends StatelessWidget {
  const ThemeSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final currentTheme = context.watch<ThemeCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizationKeys.themes.theme.tr(),
          style: TextStyle(color: context.mainTextColor),
        ),
        backgroundColor: context.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: context.mainTextColor),
      ),
      backgroundColor: context.scaffoldBackgroundColor,
      body: ListView.builder(
          itemCount: AppThemeOptions.supportedThemes.length,
          itemBuilder: (context, index) {
            return RadioListTile<ThemeMode>(
              value: AppThemeOptions.supportedThemes[index].themeMode,
              groupValue: currentTheme,
              onChanged: (mode) {
                if (mode != currentTheme && mode != null) {
                  {
                    themeCubit.updateTheme(mode);
                  }
                }
              },
              title: Row(
                children: [
                  Icon(
                    AppThemeOptions.supportedThemes[index].icon,
                    color: context.mainTextColor,
                  ),
                  SizedBox(width: 8),
                  Text(
                    AppThemeOptions.supportedThemes[index].localizationKey.tr(),
                    style: Styles.textStyleMedium15(context).copyWith(
                      color: context.mainTextColor,
                    ),
                  )
                ],
              ),
              activeColor: context.primaryColor,
            );
          }),
    );
  }
}

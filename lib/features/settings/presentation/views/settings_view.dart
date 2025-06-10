import 'package:chefio_app/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:chefio_app/core/utils/Localization/app_languages.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/theme/app_theme_options.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/settings/presentation/views/widgets/setting_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizationKeys.global.settings.tr(),
            style: TextStyle(color: context.mainTextColor)),
        backgroundColor: context.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: context.mainTextColor),
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: context.scaffoldBackgroundColor,
      body: ListView(
        children: [
          const SizedBox(height: 12),

          // Theme setting
          SettingTile(
            title: AppLocalizationKeys.themes.theme.tr(),
            value: AppThemeOptions.getThemeModeOptionFromThemeMode(theme)
                .localizationKey
                .tr(),
            onTap: () => context.push(RoutePaths.themeSelection),
          ),

          const Divider(),

          // Language setting
          SettingTile(
            title: AppLocalizationKeys.languages.language.tr(),
            value: AppLanguages.getLanguageFromCurrentLocale(context)
                .languageLocalizationKey
                .tr(),
            onTap: () => context.push(RoutePaths.languageSelection),
          ),

          const Divider(),
        ],
      ),
    );
  }
}

import 'package:chefio_app/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/settings/presentation/views/language_selection_view.dart';
import 'package:chefio_app/features/settings/presentation/views/theme_selection_view.dart';
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
    final currentLocale = context.locale;

    String getThemeName(ThemeMode mode) {
      switch (mode) {
        case ThemeMode.light:
          return 'light'.tr();
        case ThemeMode.dark:
          return 'dark'.tr();
        case ThemeMode.system:
        default:
          return 'system'.tr();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr(),
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
            title: 'theme'.tr(),
            value: getThemeName(theme),
            onTap: () => context.go(RoutePaths.themeSelection),
          ),

          const Divider(),

          // Language setting
          SettingTile(
            title: 'language'.tr(),
            value: currentLocale.languageCode == 'ar' ? 'العربية' : 'English',
            onTap: () => context.go(RoutePaths.languageSelection),
          ),

          const Divider(),
        ],
      ),
    );
  }
}

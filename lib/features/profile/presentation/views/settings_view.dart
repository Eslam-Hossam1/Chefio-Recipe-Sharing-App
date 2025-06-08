import 'package:chefio_app/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final currentTheme = context.watch<ThemeCubit>().state;
    final currentLocale = context.locale;

    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr(),
            style: TextStyle(color: context.mainTextColor)),
        backgroundColor: context.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: context.mainTextColor),
      ),
      backgroundColor: context.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'theme'.tr(),
              style: context.theme.textTheme.headlineSmall?.copyWith(
                  color: context.mainTextColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Theme options as Radio ListTiles
            ...ThemeMode.values.map((mode) {
              String title = '';
              switch (mode) {
                case ThemeMode.system:
                  title = 'system'.tr();
                  break;
                case ThemeMode.light:
                  title = 'light'.tr();
                  break;
                case ThemeMode.dark:
                  title = 'dark'.tr();
                  break;
              }
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                color: context.formColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: RadioListTile<ThemeMode>(
                  activeColor: context.primaryColor,
                  title: Text(title,
                      style: TextStyle(color: context.mainTextColor)),
                  value: mode,
                  groupValue: currentTheme,
                  onChanged: (ThemeMode? mode) {
                    if (mode != null) {
                      themeCubit.updateTheme(mode);
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              );
            }).toList(),

            const SizedBox(height: 24),

            Text(
              'language'.tr(),
              style: context.theme.textTheme.headlineSmall?.copyWith(
                  color: context.mainTextColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Language options as Radio ListTiles
            ...[
              Locale('en'),
              Locale('ar'),
            ].map((locale) {
              String title =
                  locale.languageCode == 'ar' ? 'العربية' : 'English';
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                color: context.formColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: RadioListTile<Locale>(
                  activeColor: context.primaryColor,
                  title: Text(title,
                      style: TextStyle(color: context.mainTextColor)),
                  value: locale,
                  groupValue: currentLocale,
                  onChanged: (Locale? newLocale) {
                    if (newLocale != null) {
                      context.setLocale(newLocale);
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

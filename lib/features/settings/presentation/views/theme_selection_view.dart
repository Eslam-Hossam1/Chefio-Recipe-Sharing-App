import 'package:chefio_app/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
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
        title:
            Text('theme'.tr(), style: TextStyle(color: context.mainTextColor)),
        backgroundColor: context.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: context.mainTextColor),
      ),
      backgroundColor: context.scaffoldBackgroundColor,
      body: ListView(
        children: ThemeMode.values.map((mode) {
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

          return RadioListTile<ThemeMode>(
            value: mode,
            groupValue: currentTheme,
            onChanged: (mode) {
              if (mode != currentTheme && mode != null) {
                {
                  themeCubit.updateTheme(mode);
                }
              }
            },
            title: Text(title, style: TextStyle(color: context.mainTextColor)),
            activeColor: context.primaryColor,
          );
        }).toList(),
      ),
    );
  }
}

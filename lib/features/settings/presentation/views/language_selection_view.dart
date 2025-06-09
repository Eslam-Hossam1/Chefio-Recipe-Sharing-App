import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSelectionView extends StatelessWidget {
  const LanguageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;

    return Scaffold(
      appBar: AppBar(
        title: Text('language'.tr(), style: TextStyle(color: context.mainTextColor)),
        backgroundColor: context.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: context.mainTextColor),
      ),
      backgroundColor: context.scaffoldBackgroundColor,
      body: ListView(
        children: [
          RadioListTile<Locale>(
            value: const Locale('en'),
            groupValue: currentLocale,
            onChanged: (locale) => context.setLocale(locale!),
            title: const Text("English"),
            activeColor: context.primaryColor,
          ),
          RadioListTile<Locale>(
            value: const Locale('ar'),
            groupValue: currentLocale,
            onChanged: (locale) => context.setLocale(locale!),
            title: const Text("العربية"),
            activeColor: context.primaryColor,
          ),
        ],
      ),
    );
  }
}

import 'package:chefio_app/core/utils/Localization/app_languages.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSelectionView extends StatelessWidget {
  const LanguageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizationKeys.languages.language.tr(),
            style: TextStyle(color: context.mainTextColor)),
        backgroundColor: context.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: context.mainTextColor),
      ),
      backgroundColor: context.scaffoldBackgroundColor,
      body: ListView.builder(
        itemCount: AppLanguages.supportedLanguages.length,
        itemBuilder: (context, index) {
          return RadioListTile<Locale>(
            value: AppLanguages.supportedLanguages[index].languageLocale,
            groupValue: currentLocale,
            onChanged: (locale) => context.setLocale(locale!),
            title: Row(
              children: [
                CountryFlag.fromCountryCode(
                  AppLanguages.supportedLanguages[index].countryFlagCode,
                  shape: const RoundedRectangle(4),
                  width: 36,
                  height: 24,
                ),
                SizedBox(width: 8),
                Text(
                  AppLanguages.supportedLanguages[index].languageLocalizationKey
                      .tr(),
                  style: TextStyle(
                    color: context.mainTextColor,
                  ),
                ),
              ],
            ),
            activeColor: context.primaryColor,
          );
        },
      ),
    );
  }
}

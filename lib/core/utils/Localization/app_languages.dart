import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/Localization/models/language_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class AppLanguages {
  static final LanguageModel arabic = LanguageModel(
    languageLocale: Locale('ar'),
    languageName: 'Arabic',
    languageLocalizationKey: AppLocalizationKeys.languages.arabic,
    countryFlagCode: 'sa',
  );

  static final LanguageModel english = LanguageModel(
    languageLocale: Locale('en'),
    languageName: 'English',
    languageLocalizationKey: AppLocalizationKeys.languages.english,
    countryFlagCode: 'us',
  );
  static final LanguageModel spanish = LanguageModel(
    languageLocale: Locale('es'),
    languageName: 'Spanish',
    languageLocalizationKey: AppLocalizationKeys.languages.spanish,
    countryFlagCode: 'es',
  );

  static final List<LanguageModel> supportedLanguages = [
    arabic,
    english,
    spanish
  ];

  static LanguageModel getLanguageFromCurrentLocale(BuildContext context) {
    final locale = context.locale;
    for (var languageModel in AppLanguages.supportedLanguages) {
      if (languageModel.languageLocale.languageCode == locale.languageCode) {
        return languageModel;
      }
    }
    return AppLanguages.english; // Default to English if no match found
  }
}

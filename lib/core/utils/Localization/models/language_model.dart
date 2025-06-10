import 'dart:ui';

class LanguageModel {
  final Locale languageLocale;
  final String languageName;
  final String languageLocalizationKey;
  final String countryFlagCode;

  const LanguageModel(
      {required this.languageName,
      required this.languageLocale,
      required this.languageLocalizationKey,
      required this.countryFlagCode});
}

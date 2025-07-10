import 'package:chefio_app/core/utils/Localization/app_locals.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class LocalizationHelper {
  static Future<void> changeLanguage(
      BuildContext context, Locale locale) async {
    await context.setLocale(locale);
  }

  static Locale getCurrentLocale(BuildContext context) {
    return context.locale;
  }

  static Future<void> resetToDefaultLanguage(BuildContext context) async {
    await context.setLocale(context.supportedLocales.first);
  }

  static checkArabicLocale(BuildContext context) {
    return context.locale == AppLocals.arabic;
  }
}

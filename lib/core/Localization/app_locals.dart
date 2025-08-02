import 'dart:ui';

abstract class AppLocals {
  static const Locale arabic = Locale('ar');
  static const Locale english = Locale('en');
  static const Locale spanish = Locale('es');

  static const supportedLocales = [
    arabic,
    english,
    spanish,
  ];
}

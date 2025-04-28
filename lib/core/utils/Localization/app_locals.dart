import 'package:flutter/material.dart';

abstract class AppLocales {
  static const Locale arabic = Locale('ar');
  static const Locale english = Locale('en');

  static const List<Locale> supportedLocales = [
    arabic,
    english,
  ];
}

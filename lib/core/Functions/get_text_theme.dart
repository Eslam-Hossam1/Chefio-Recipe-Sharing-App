import 'package:chefio_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme getTextTheme(BuildContext context) {
  switch (context.locale) {
    case Constants.arabicLocale:
      return GoogleFonts.tajawalTextTheme();
    case Constants.englishLocale:
      return GoogleFonts.interTextTheme();
    default:
      return GoogleFonts.interTextTheme();
  }
}

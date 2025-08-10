import 'package:chefio_app/core/Localization/app_locals.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme getTextTheme(BuildContext context) {
  switch (context.locale) {
    case AppLocals.arabic:
      return GoogleFonts.cairoTextTheme();
    case AppLocals.english:
      return GoogleFonts.interTextTheme();
    default:
      return GoogleFonts.interTextTheme();
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chefio_app/core/Functions/custom_adaptive_awesome_dialog.dart';
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static void showErrorDialog(BuildContext context, String errorMessage) {
    customAdaptiveAwesomeDialog(
      context,
      dialogType: DialogType.error,
      title: AppLocalizationKeys.global.error.tr(),
      desc: errorMessage,
      btnOkOnPress: () {},
    ).show();
  }

  static void showSuccessDialog(BuildContext context, String successMessage,
      VoidCallback onDismissCallback) {
    customAdaptiveAwesomeDialog(
      context,
      dialogType: DialogType.success,
      title: AppLocalizationKeys.global.success.tr(),
      desc: successMessage,
      btnOkOnPress: () {},
      onDismissCallback: (_) => onDismissCallback(),
    ).show();
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chefio_app/core/Functions/custom_adaptive_awesome_dialog.dart';
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class DialogHelper {
  static void showErrorDialog(BuildContext context,{ required String errorMessage,String? btnOkText,void Function()? btnOkOnPress, void Function(DismissType)? onDismissCallback,Widget? btnOk,}) {
    customAdaptiveAwesomeDialog(
      context,
      dialogType: DialogType.error,
      title: AppLocalizationKeys.global.error.tr(),
      desc: errorMessage,
      btnOkOnPress:btnOkOnPress,
      btnOkText: btnOkText,
      btnOk: btnOk,
      onDismissCallback: onDismissCallback,
    ).show();
  }

  static void showSuccessDialog(BuildContext context,{required String successMessage,String? btnOkText,void Function()? btnOkOnPress, void Function(DismissType)? onDismissCallback,Widget? btnOk,}) {
    customAdaptiveAwesomeDialog(
      context,
      dialogType: DialogType.success,
      title: AppLocalizationKeys.global.success.tr(),
      desc: successMessage,
      btnOkOnPress: btnOkOnPress,
      btnOk: btnOk,
      btnOkText: btnOkText,
      onDismissCallback:onDismissCallback,
    ).show();
  }
}

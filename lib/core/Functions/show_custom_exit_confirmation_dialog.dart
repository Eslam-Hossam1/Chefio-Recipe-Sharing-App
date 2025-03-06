import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showCustomExitConfirmationDialog(BuildContext context,
    {required String errorMessage,required void Function()? btnOkOnPress}) {
  DialogHelper.showWarningDialog(context,
      errorMessage: errorMessage,
      btnOkOnPress: btnOkOnPress,
      btnOkColor: context.secondaryColor,
      btnOkText: AppLocalizationKeys.global.exit.tr(),
      btnCancelColor: context.primaryColor,
      btnCanceltext: AppLocalizationKeys.global.stay.tr());
}

 import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/colors.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showCustomExitConfirmationDialog(BuildContext context,{required String errorMessage}) {
     DialogHelper.showWarningDialog(context,
        errorMessage: errorMessage,
            btnOkOnPress: () => context.pop(),
            btnOkColor: AppColors.getSecondaryColor(context),
            btnOkText: AppLocalizationKeys.global.exit.tr(),
            btnCancelColor: AppColors.getPrimaryColor(context),
            btnCanceltext: AppLocalizationKeys.global.stay.tr()
            );
  }
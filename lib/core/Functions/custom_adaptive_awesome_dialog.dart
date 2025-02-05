import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chefio_app/core/utils/colors.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

AwesomeDialog customAdaptiveAwesomeDialog(BuildContext context,
    {required DialogType dialogType,
    AnimType? animType,
    required String title,
    required String desc,
    void Function()? btnOkOnPress,
    void Function()? btnCancelOnPress,
    bool dismissOnTouchOutside = true,
    bool dismissOnBackKeyPress = true,
    void Function(DismissType)? onDismissCallback}) {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: animType ?? AnimType.rightSlide,
    title: title,
    desc: desc,
    dialogBackgroundColor: AppColors.getAwesomeDialogBackgroundColor(context),
    titleTextStyle: Styles.textStyleAwesomeDialogTitle(context),
    descTextStyle: Styles.textStyleAwesomeDialogDesc(context),
    btnOkColor: AppColors.getPrimaryColor(context),
    btnCancelColor: AppColors.getSecondaryColor(context),
    btnCancelOnPress: btnCancelOnPress,
    btnOkOnPress: btnOkOnPress,
    dismissOnBackKeyPress: dismissOnBackKeyPress,
    dismissOnTouchOutside: dismissOnTouchOutside,
    onDismissCallback: onDismissCallback,
    width: getAwesomeDialogAdaptiveWidth(context),
  );
}

getAwesomeDialogAdaptiveWidth(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tabletBreakPoint) {
    return width * .9;
  } else {
    return (width - (width * .20 * 2)) * .8;
  }
}

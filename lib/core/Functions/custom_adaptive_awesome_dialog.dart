import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/app_colors.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

AwesomeDialog customAdaptiveAwesomeDialog(BuildContext context,
    {required DialogType dialogType,
    AnimType? animType,
    required String title,
    required String desc,
    String? btnOkText,
    void Function()? btnOkOnPress,
    void Function()? btnCancelOnPress,
    bool dismissOnTouchOutside = true,
    bool dismissOnBackKeyPress = true,
    Widget? btnOk,
    Color? btnOkColor,
    Color? btnCancelColor,
    String? btnCancelText,
    void Function(DismissType)? onDismissCallback}) {
  return AwesomeDialog(
    padding: EdgeInsets.symmetric(horizontal: 8),
    context: context,
    dialogType: dialogType,
    animType: animType ?? AnimType.rightSlide,
    title: title,
    desc: desc,
    dialogBackgroundColor: context.dialogBackgroundColor,
    titleTextStyle: Styles.textStyleAwesomeDialogTitle(context),
    descTextStyle: Styles.textStyleAwesomeDialogDesc(context),
    btnOkColor: btnOkColor ?? AppColors.lightPrimary,
    btnCancelColor: btnCancelColor ?? Colors.red,
    btnCancelText: btnCancelText,
    btnCancelOnPress: btnCancelOnPress,
    btnOkOnPress: btnOkOnPress,
    btnOkText: btnOkText,
    btnOk: btnOk,
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

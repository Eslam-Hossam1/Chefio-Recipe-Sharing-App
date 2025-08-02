import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showCustomToast(
  BuildContext context, {
  required String message,
}) {
  toastification.show(
    context: context,
    type: ToastificationType.info,
    style: ToastificationStyle.simple,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(
      message,
      style: Styles.textStyleMedium17(context)
          .copyWith(color: context.mainTextColor),
      textAlign: TextAlign.center,
    ),
    alignment: Alignment.center,
    primaryColor: context.primaryColor,
    backgroundColor: context.toastColor,
    foregroundColor: context.mainTextColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    closeOnClick: true,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
  );
}

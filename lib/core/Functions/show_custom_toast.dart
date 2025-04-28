import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

void showCustomToast(
  BuildContext context, {
  required String message,
  int seconds = 3,
}) {
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).size.height * 0.4,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: (MediaQuery.sizeOf(context).width * .8).clamp(100, 400),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: context.toastColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message,
            style: Styles.textStyleMedium17(context)
                .copyWith(color: context.mainTextColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlayEntry);

  Future.delayed(Duration(seconds: seconds), () {
    overlayEntry.remove();
  });
}

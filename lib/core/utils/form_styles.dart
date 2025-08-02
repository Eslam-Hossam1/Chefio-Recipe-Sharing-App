import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

abstract class FormStyles {
  static OutlineInputBorder buildCustomTextFormFieldBorder(BuildContext context,
      {double? borderRadius}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 32),
      borderSide: BorderSide(
        width: 2,
        color: context.outlineColor,
      ),
    );
  }

  static OutlineInputBorder buildRadiusTransperantBorder(BuildContext context,
      {double? borderRadius}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 32),
      borderSide: BorderSide(width: 0, color: Colors.transparent),
    );
  }
}

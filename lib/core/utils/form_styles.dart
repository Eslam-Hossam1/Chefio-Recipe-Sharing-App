import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';

abstract class FormStyles {
  static OutlineInputBorder buildBorder(BuildContext context,
      {double? borderRadius}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 32),
      borderSide: BorderSide(
        width: 2,
        color: context.outlineColor,
      ),
    );
  }
}

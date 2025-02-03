import 'package:chefio_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

abstract class FormStyles {
  static OutlineInputBorder buildBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide(
        width: 2,
        color: AppColors.getOutlineColor(context),
      ),
    );
  }
}

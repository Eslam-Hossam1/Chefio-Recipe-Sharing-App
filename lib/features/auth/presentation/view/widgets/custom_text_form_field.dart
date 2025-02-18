import 'dart:developer';

import 'package:chefio_app/core/Functions/form_validators.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/form_styles.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.onSaved,
    this.verticalPadding,
    this.prefixIcon,
    this.validator,
  });
  final String hint;
  final void Function(String?)? onSaved;
  final double? verticalPadding;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator ?? FormValidators.customTextFormFieldValidator,
      cursorColor: context.primaryColor,
      style: Styles.textStyleSemiBold15(context).copyWith(
        color: context.mainTextColor,
      ),
      decoration: InputDecoration(
        errorMaxLines: 2,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        hintText: hint,
        hintStyle: Styles.textStyleMedium15(context).copyWith(
          color: context.secondaryTextColor,
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsetsDirectional.only(start: 24, end: 10),
                child: prefixIcon)
            : null,
        border: FormStyles.buildBorder(context),
        enabledBorder: FormStyles.buildBorder(context),
        focusedBorder: FormStyles.buildBorder(context).copyWith(
          borderSide: BorderSide(
            width: 2,
            color:context.primaryColor,
          ),
        ),
      ),
    );
  }
}

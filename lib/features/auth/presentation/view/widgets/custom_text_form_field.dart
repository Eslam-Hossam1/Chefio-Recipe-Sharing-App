import 'dart:developer';

import 'package:chefio_app/core/Functions/form_validators.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/form_styles.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
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
    this.maxLines,
    this.borderRadius,
    this.initialValue,
    this.onChanged,
    this.focusNode,
  });
  final String hint;
  final void Function(String?)? onSaved;
  final double? verticalPadding;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final int? maxLines;
  final double? borderRadius;
  final String? initialValue;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChanged,
      initialValue: initialValue,
      maxLines: maxLines ?? 1,
      onSaved: onSaved,
      validator: validator ?? FormValidators.customTextFormFieldValidator,
      cursorColor: context.primaryColor,
      style: Styles.textStyleSemiBold15(context).copyWith(
        color: context.mainTextColor,
      ),
      decoration: InputDecoration(
        errorMaxLines: 2,
        contentPadding: EdgeInsetsDirectional.only(
            top: 16, bottom: 16, start: prefixIcon == null ? 24 : 0),
        hintText: hint,
        hintStyle: Styles.textStyleMedium15(context).copyWith(
          color: context.secondaryTextColor,
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsetsDirectional.only(start: 24, end: 10),
                child: prefixIcon)
            : null,
        border: FormStyles.buildCustomTextFormFieldBorder(
          context,
          borderRadius: borderRadius,
        ),
        enabledBorder: FormStyles.buildCustomTextFormFieldBorder(
          context,
          borderRadius: borderRadius,
        ),
        focusedBorder: FormStyles.buildCustomTextFormFieldBorder(
          context,
          borderRadius: borderRadius,
        ).copyWith(
          borderSide: BorderSide(
            width: 2,
            color: context.primaryColor,
          ),
        ),
      ),
    );
  }
}

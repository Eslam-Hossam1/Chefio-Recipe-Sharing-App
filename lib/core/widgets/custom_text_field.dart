import 'package:chefio_app/core/utils/form_styles.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
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
    this.suffixIcon,
    this.onSubmitted,
    this.textInputAction,
    this.hintStyle,
    this.controller,
  });
  final String hint;
  final void Function(String?)? onSaved;
  final double? verticalPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final double? borderRadius;
  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      maxLines: maxLines,
      cursorColor: context.primaryColor,
      style: Styles.textStyleSemiBold15(context).copyWith(
        color: context.mainTextColor,
      ),
      decoration: InputDecoration(
        errorMaxLines: 2,
        contentPadding: EdgeInsetsDirectional.only(
            top: 16, bottom: 16, start: prefixIcon == null ? 24 : 0),
        hintText: hint,
        hintStyle: hintStyle ??
            Styles.textStyleMedium15(context).copyWith(
              color: context.secondaryTextColor,
            ),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsetsDirectional.only(start: 24, end: 10),
                child: prefixIcon)
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsetsDirectional.only(start: 10, end: 24),
                child: suffixIcon)
            : null,
        suffixIconConstraints: BoxConstraints(),
        border: FormStyles.buildRadiusTransperantBorder(
          context,
          borderRadius: borderRadius,
        ),
        enabledBorder: FormStyles.buildRadiusTransperantBorder(
          context,
          borderRadius: borderRadius,
        ),
        focusedBorder: FormStyles.buildRadiusTransperantBorder(
          context,
          borderRadius: borderRadius,
        ),
        fillColor: context.formColor,
        filled: true,
      ),
    );
  }
}

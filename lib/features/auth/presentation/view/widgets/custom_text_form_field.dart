import 'dart:developer';

import 'package:chefio_app/core/Functions/text_form_field_validator.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/colors.dart';
import 'package:chefio_app/core/utils/form_styles.dart';
import 'package:chefio_app/core/utils/styles.dart';
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
  });
  final String hint;
  final void Function(String?)? onSaved;
  final double? verticalPadding;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: customTextFormFieldValidator,
      cursorColor: AppColors.getPrimaryColor(context),
      style: Styles.textStyleSemiBold15(context).copyWith(
        color: AppColors.getMainTextColor(context),
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        hintText: hint,
        hintStyle: Styles.textStyleMedium15(context).copyWith(
          color: AppColors.getSecondaryTextColor(context),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 24, end: 10),
          child: prefixIcon ??
              SvgPicture.asset(
                Assets.imagesEmailIcon,
              ),
        ),
        border: FormStyles.buildBorder(context),
        enabledBorder: FormStyles.buildBorder(context),
        focusedBorder: FormStyles.buildBorder(context).copyWith(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.getPrimaryColor(context),
          ),
        ),
      ),
    );
  }
}

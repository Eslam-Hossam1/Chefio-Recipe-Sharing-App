import 'dart:developer';

import 'package:chefio_app/core/utils/colors.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeField extends StatelessWidget {
  const CustomPinCodeField({super.key, this.onChanged, this.onCompleted});
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;
  @override
  Widget build(BuildContext context) {
    log((24 * (MediaQuery.sizeOf(context).width / Constants.kDesignWidth))
        .toString());
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getPinCodeTextFeildPadding(context)),
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        textStyle: Styles.textStyleSemiBold34(context)
            .copyWith(color: AppColors.getMainTextColor(context), height: -1),

        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(20.r),
          fieldHeight: getfieldWidth(context),
          fieldWidth: getfieldWidth(context),
          activeColor: AppColors.getPrimaryColor(context),
          inactiveColor: AppColors.getOutlineColor(context),
          selectedColor: Colors.blue,
        ),
        onChanged: onChanged, // Optional for real-time input tracking
        onCompleted: onCompleted, // Callback when the user completes input
      ),
    );
  }

  double getPinCodeTextFeildPadding(BuildContext context) {
    return (24 * (MediaQuery.sizeOf(context).width / Constants.kDesignWidth));
  }

  double getfieldWidth(context) {
    double width = MediaQuery.sizeOf(context).height;
    return (24 * (width / Constants.kDesignWidth)).clamp(18, 72);
  }
}

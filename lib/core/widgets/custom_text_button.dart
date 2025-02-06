import 'package:chefio_app/core/utils/colors.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      this.backgroundColor,
      required this.child,
      this.onPressed,
      this.height,
      this.width,
      this.borderSide});
  final Color? backgroundColor;
  final Widget child;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final BorderSide? borderSide;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? getCustomButtonResponsiveHeight(context),
      width: width,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              side: borderSide,
              backgroundColor:
                  backgroundColor ?? AppColors.getPrimaryColor(context)),
          child: child),
    );
  }

  double getCustomButtonResponsiveHeight(BuildContext context) {
    double bigTabletWidth = 1000;
    double width = MediaQuery.sizeOf(context).width;
    double upperlimit = width >= bigTabletWidth ? 80 : 60;
    return (56 * (width / Constants.kDesignWidth)).clamp(56, upperlimit);
  }
}

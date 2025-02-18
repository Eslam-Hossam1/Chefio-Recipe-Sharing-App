import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PasswordStandard extends StatelessWidget {
  const PasswordStandard({
    super.key,
    required this.isValid,
    required this.standardText,
  });
  final bool isValid;
  final String standardText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
            isValid ? Assets.imagesGreenDoneIcon : Assets.imagesGrayDoneIcon),
        SizedBox(
          width: 8.w,
        ),
        Text(
          standardText,
          style: Styles.textStyleMedium15(context).copyWith(
            color: isValid
                ?context.mainTextColor
                :context.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}

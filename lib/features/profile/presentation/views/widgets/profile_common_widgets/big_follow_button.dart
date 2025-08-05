import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigFollowButton extends StatelessWidget {
  const BigFollowButton(
      {super.key,
      required this.isFollowing,
      required this.onPressed,
      required this.isLoading});
  final bool isFollowing;
  final VoidCallback onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    final buttonText = isFollowing
        ? AppLocalizationKeys.profile.followed.tr()
        : AppLocalizationKeys.profile.follow.tr();
    final buttonColor = isFollowing ? context.formColor : context.primaryColor;
    final cicularProgressIndicatorColor =
        isFollowing ? context.primaryColor : Colors.white;
    final textColor = isFollowing ? context.mainTextColor : Colors.white;
    return Padding(
      padding: EdgeInsets.only(right: 56.w, left: 56.w, bottom: 24),
      child: AbsorbPointer(
        absorbing: isLoading,
        child: CustomTextButton(
          onPressed: onPressed,
          backgroundColor: buttonColor,
          child: isLoading
              ? CustomCircularProgressIndicator(
                  color: cicularProgressIndicatorColor,
                )
              : Text(
                  buttonText,
                  style: Styles.textStyleBold15(context)
                      .copyWith(color: textColor),
                ),
        ),
      ),
    );
  }
}

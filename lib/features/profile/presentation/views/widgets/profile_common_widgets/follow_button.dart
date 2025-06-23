import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    super.key,
    required this.isFollowing,
    required this.onPressed,
    this.isLoading,
    this.width,
    this.height,
    this.internalPadding,
  });

  final bool isFollowing;
  final VoidCallback onPressed;
  final bool? isLoading;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? internalPadding;

  @override
  Widget build(BuildContext context) {
    final buttonText = isFollowing
        ? AppLocalizationKeys.profile.followed.tr()
        : AppLocalizationKeys.profile.follow.tr();
    final buttonColor = isFollowing ? context.formColor : context.primaryColor;
    final textColor = isFollowing ? context.mainTextColor : Colors.white;
    final cicularProgressIndicatorColor =
        isFollowing ? context.primaryColor : Colors.white;

    return AbsorbPointer(
      absorbing: isLoading ?? false,
      child: CustomTextButton(
          width: width ?? 95.w,
          onPressed: () {
            onPressed();
          },
          backgroundColor: buttonColor,
          child: (isLoading != null && isLoading!)
              ? Center(
                  child: CustomCircularProgressIndicator(
                    color: cicularProgressIndicatorColor,
                  ),
                )
              : Text(
                  buttonText,
                  style: Styles.textStyleBold12(context).copyWith(
                    color: textColor,
                  ),
                )),
    );
  }
}

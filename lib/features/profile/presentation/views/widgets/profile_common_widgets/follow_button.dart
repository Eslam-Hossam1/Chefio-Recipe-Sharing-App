import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    super.key,
    required this.isFollowing,
    required this.onPressed,
    this.isLoading,
  });

  final bool isFollowing;
  final VoidCallback onPressed;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    final buttonText = isFollowing ? 'Followed' : 'Follow';
    final buttonColor = isFollowing ? context.formColor : context.primaryColor;
    final textColor = isFollowing ? context.mainTextColor : Colors.white;
    final cicularProgressIndicatorColor =
        isFollowing ? context.primaryColor : Colors.white;

    return AbsorbPointer(
      absorbing: isLoading ?? false,
      child: CustomTextButton(
          width: 100.w,
          onPressed: () {
            onPressed();
          },
          backgroundColor: buttonColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
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
                  ),
          )),
    );
  }
}

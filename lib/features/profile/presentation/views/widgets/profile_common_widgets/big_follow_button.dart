import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final buttonText = isFollowing ? 'Followed' : 'Follow';
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

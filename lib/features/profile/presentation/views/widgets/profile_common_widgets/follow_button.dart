
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowButton extends StatelessWidget {
  const FollowButton(
      {super.key, required this.isFollowing, required this.onPressed});
  final bool isFollowing;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final buttonText = isFollowing ? 'Followed' : 'Follow';
    final buttonColor = isFollowing ? context.formColor : context.primaryColor;
    final textColor = isFollowing ? context.mainTextColor : Colors.white;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 56.w, vertical: 24),
      child: CustomTextButton(
        onPressed: onPressed,
        backgroundColor: buttonColor,
        child: Text(
          buttonText,
          style: Styles.textStyleBold15(context).copyWith(color: textColor),
        ),
      ),
    );
  }
}

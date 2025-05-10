import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class ProfileChefInfoItem extends StatelessWidget {
  const ProfileChefInfoItem({
    super.key,
    required this.number,
    required this.text,
  });
  final String number;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: Styles.textStyleBold17(context).copyWith(
            color: context.mainTextColor,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          text,
          style: Styles.textStyleMedium12(context).copyWith(
            color: context.secondaryTextColor,
          ),
        )
      ],
    );
  }
}

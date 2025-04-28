import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class CustomBold17Title extends StatelessWidget {
  const CustomBold17Title({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: Styles.textStyleBold17(context).copyWith(
            color: context.mainTextColor,
          ),
        ),
      ],
    );
  }
}

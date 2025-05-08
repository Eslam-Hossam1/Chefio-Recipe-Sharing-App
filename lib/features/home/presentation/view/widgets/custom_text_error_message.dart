import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class CustomTextInfoMessage extends StatelessWidget {
  const CustomTextInfoMessage({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: Styles.textStyleMedium17(context)
            .copyWith(color: context.mainTextColor),
      ),
    );
  }
}

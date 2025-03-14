
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class CustomTextErrorMessage extends StatelessWidget {
  const CustomTextErrorMessage({
    super.key, required this.text,
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

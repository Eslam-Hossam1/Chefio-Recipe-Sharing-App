
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class SliderDurationLabel extends StatelessWidget {
  const SliderDurationLabel({
    super.key,
    required this.text,
    required this.active,
  });
  final String text;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.textStyleBold15(context).copyWith(
        color: active ? context.primaryColor : context.secondaryTextColor,
      ),
    );
  }
}
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class SliderDurationLabel extends StatelessWidget {
  const SliderDurationLabel({
    super.key,
    required this.duration,
    required this.currentValue,
    this.text,
  });
  final int duration;
  final int currentValue;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '$duration',
      style: Styles.textStyleBold15(context).copyWith(
        color: currentValue >= duration
            ? context.primaryColor
            : context.secondaryTextColor,
      ),
    );
  }
}

import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key, this.color,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color:color??context.primaryColor,
    );
  }
}

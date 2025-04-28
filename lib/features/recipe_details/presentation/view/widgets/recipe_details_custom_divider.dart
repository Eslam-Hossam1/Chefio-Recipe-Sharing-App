import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailsCustomDivider extends StatelessWidget {
  const RecipeDetailsCustomDivider({
    super.key,
    this.thickness = 1,
    this.height = 32,
    this.color,
  });
  final double thickness;
  final double height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: color ?? context.outlineColor,
      height: height,
    );
  }
}

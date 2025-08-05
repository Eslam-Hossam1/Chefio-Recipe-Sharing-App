import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

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

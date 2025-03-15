import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgNavIcon extends StatelessWidget {
  final String svgImagePath;
  final bool isSelected;

  const CustomSvgNavIcon(
      {required this.svgImagePath, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgImagePath,
      colorFilter: ColorFilter.mode(
        isSelected ? context.primaryColor : context.secondaryTextColor,
        BlendMode.srcIn,
      ),
    );
  }
}

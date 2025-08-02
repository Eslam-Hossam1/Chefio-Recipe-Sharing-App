import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/main/presentation/view/widgets/custom_svg_nav_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

BottomNavigationBarItem buildBottomNavigationBarItem(
  BuildContext context, {
  required String svgImagePath,
  required String localizationKey,
  required bool isSelected,
}) {
  return BottomNavigationBarItem(
    icon: CustomSvgNavIcon(
      svgImagePath: svgImagePath,
      isSelected: isSelected,
    ),
    label: localizationKey.tr(),
    backgroundColor: context.scaffoldBackgroundColor,
  );
}

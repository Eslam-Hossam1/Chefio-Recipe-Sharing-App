import 'package:flutter/widgets.dart';

class PopUpMenuModel {
  final IconData iconData;
  final Color? color;
  final String textLocalizationKey;
  final void Function(BuildContext context) onTap;

  const PopUpMenuModel({
    required this.iconData,
    this.color,
    required this.textLocalizationKey,
    required this.onTap,
  });
}

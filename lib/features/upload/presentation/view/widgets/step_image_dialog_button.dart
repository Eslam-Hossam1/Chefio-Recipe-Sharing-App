import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class StepImageDialogButton extends StatelessWidget {
  const StepImageDialogButton({
    super.key,
    required this.text,
    required this.icon,
    this.color,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final Color? color;
  final dynamic Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: color ?? context.mainTextColor,
                ),
                Text(
                  text,
                  style: Styles.textStyleMedium15(context).copyWith(
                    color: color ?? context.mainTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

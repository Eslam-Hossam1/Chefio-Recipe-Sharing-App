import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class ScrollableSheetDraggerIcon extends StatelessWidget {
  const ScrollableSheetDraggerIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 8,
          decoration: BoxDecoration(
            color: context.outlineColor,
            borderRadius: BorderRadius.circular(100),
          ),
        )
      ],
    );
  }
}

import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class RecipeDetailsAppBarBottom extends StatelessWidget {
  const RecipeDetailsAppBarBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
      child: Row(
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
      ),
    );
  }
}

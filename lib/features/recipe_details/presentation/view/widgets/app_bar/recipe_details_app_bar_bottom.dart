import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class RecipeDetailsAppBarBottom extends StatelessWidget {
  const RecipeDetailsAppBarBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 1),
      child: Container(
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
      ),
    );
  }
}

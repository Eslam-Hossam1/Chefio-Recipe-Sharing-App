import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class RecipeCategoryWithCookingDurationText extends StatelessWidget {
  const RecipeCategoryWithCookingDurationText({
    super.key,
    required this.categoryName,
    required this.cookingDuration,
  });

  final String categoryName;
  final String cookingDuration;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$categoryName $cookingDuration mins",
          style: Styles.textStyleMedium12(context)
              .copyWith(color: context.secondaryTextColor),
        ),
      ],
    );
  }
}

import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecipeDetailsIngredientItem extends StatelessWidget {
  const RecipeDetailsIngredientItem({
    super.key,
    required this.ingredientText,
  });
  final String ingredientText;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(Theme.of(context).brightness == Brightness.light
            ? Assets.imagesGreenDoneIcon
            : Assets.imagesGrayDoneIcon),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Text(
            ingredientText,
            style: Styles.textStyleMedium15(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
        ),
      ],
    );
  }
}

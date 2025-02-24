import 'dart:ui';

import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item_image_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 40),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(Assets.imagesUserOneTest))),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Eslam Hossam',
              style: Styles.textStyleMedium12(context)
                  .copyWith(color: context.mainTextColor),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Flexible(child: RecipeItemImageWithIcon()),
        SizedBox(
          height: 16,
        ),
        Text(
          "Pancake",
          style: Styles.textStyleBold17(context)
              .copyWith(color: context.mainTextColor),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Food . > 60 mins",
          style: Styles.textStyleMedium12(context)
              .copyWith(color: context.secondaryTextColor),
        ),
      ],
    );
  }
}

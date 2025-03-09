import 'dart:ui';

import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item_header.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item_image_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecipeItemHeader(),
          SizedBox(
            height: 16,
          ),
          Flexible(
              child: Container(
                  color: Colors.red, child: RecipeItemImageWithIcon())),
          SizedBox(
            height: 16,
          ),
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            "Pancfjh syrup",
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
      ),
    );
  }
}

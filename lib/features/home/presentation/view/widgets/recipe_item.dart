import 'dart:ui';

import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/recipe_category_with_cooking_duration_text.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item_body.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item_header.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item_image_with_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({super.key, required this.recipeModel});
  final Recipe recipeModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecipeItemHeader(
          recipeModel: recipeModel,
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(child: RecipeItemBody(recipeModel: recipeModel)),
      ],
    );
  }
}

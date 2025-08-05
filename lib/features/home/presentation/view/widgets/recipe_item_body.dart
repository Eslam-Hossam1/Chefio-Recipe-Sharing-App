import 'package:chefio_app/core/Entities/recipe_body_entity.dart';
import 'package:chefio_app/core/routing/routing_helper.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/recipe_category_with_cooking_duration_text.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item_image_with_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipeItemBody extends StatelessWidget {
  const RecipeItemBody({super.key, required this.recipeBodyEntity});
  final RecipeBodyEntity recipeBodyEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          RoutingHelper.getRecipeDetailsPath(
            recipeId: recipeBodyEntity.recipeId,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              child: RecipeItemImageWithIcon(
            recipeBodyEntity: recipeBodyEntity,
          )),
          SizedBox(
            height: 16,
          ),
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            recipeBodyEntity.recipeName,
            style: Styles.textStyleBold17(context)
                .copyWith(color: context.mainTextColor),
          ),
          SizedBox(
            height: 8,
          ),
          RecipeCategoryWithCookingDurationText(
            categoryName:
                recipeBodyEntity.recipeCategory.categoryLocalizationKey?.tr() ??
                    recipeBodyEntity.recipeCategory.name,
            cookingDuration: recipeBodyEntity.recipeCookingDuration.toString(),
          ),
        ],
      ),
    );
  }
}

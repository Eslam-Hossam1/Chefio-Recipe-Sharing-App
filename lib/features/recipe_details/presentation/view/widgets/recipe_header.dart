
import 'package:chefio_app/core/widgets/recipe_category_with_cooking_duration_text.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/custom_bold_17_title.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_custom_like.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/user_tile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeHeader extends StatelessWidget {
  const RecipeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBold17Title(
          text: context.read<RecipeDetailsCubit>().recipeDetailModel!.foodName,
        ),
        SizedBox(height: 8),
        RecipeCategoryWithCookingDurationText(
          categoryName: context.read<RecipeDetailsCubit>().recipeDetailModel!.categoryName,
          cookingDuration: context.read<RecipeDetailsCubit>().recipeDetailModel!.foodCookDuration.toString(),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: UserTileItem(),
            ),
            SizedBox(
              width: 12.w,
            ),
            RecipeDetailsCustomLike(
              likes: 277,
              isLiked: false,
            ),
          ],
        ),
      ],
    );
  }
}

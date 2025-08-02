import 'package:chefio_app/core/routing/routing_helper.dart';
import 'package:chefio_app/core/widgets/recipe_category_with_cooking_duration_text.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/custom_bold_17_title.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_custom_like.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/user_tile_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RecipeDetailsHeader extends StatelessWidget {
  const RecipeDetailsHeader({
    super.key,
    required this.recipeDetailsModel,
  });
  final RecipeDetailsModel recipeDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBold17Title(
          text: context.read<RecipeDetailsCubit>().recipeDetailModel!.foodName,
        ),
        SizedBox(height: 8),
        RecipeCategoryWithCookingDurationText(
          categoryName:
              recipeDetailsModel.category.categoryLocalizationKey?.tr() ??
                  recipeDetailsModel.category.name,
          cookingDuration: recipeDetailsModel.cookingDuration.toString(),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.push(
                    RoutingHelper.getProfilePath(
                      chefId: recipeDetailsModel.createdBy.id,
                    ),
                  );
                },
                child: UserTileItem(
                  userName: recipeDetailsModel.createdBy.username,
                  userImageUrl: recipeDetailsModel.createdBy.profilePicture,
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            RecipeDetailsCustomLike(
              recipeDetailsModel: recipeDetailsModel,
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_ingredient_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailsIngredientsSliverList extends StatelessWidget {
  const RecipeDetailsIngredientsSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 3,
      itemBuilder: (context, index) {
        return RecipeDetailsIngredientItem(
          ingredientText: context
              .read<RecipeDetailsCubit>()
              .recipeDetailModel!
              .ingredients[index],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 16.h,
        );
      },
    );
  }
}

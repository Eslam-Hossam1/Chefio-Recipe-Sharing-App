import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe.dart';
import 'package:chefio_app/features/home/presentation/manager/home_recipes_cubit/home_recipes_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesGrid extends StatelessWidget {
  const RecipesGrid({
    super.key,
    required this.recipes,
  });
  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    bool isMobile = width < SizeConfig.tabletBreakPoint;
    return GridView.builder(
        padding: EdgeInsets.only(top: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 2 : 3,
            childAspectRatio: isMobile ? 0.500 : 0.560,
            crossAxisSpacing: 25,
            mainAxisSpacing: 32),
        itemBuilder: (context, index) {
          return RecipeItem(recipeModel: recipes[index]);
        },
        itemCount: recipes.length);
  }
}

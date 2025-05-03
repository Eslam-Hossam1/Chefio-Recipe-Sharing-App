import 'package:chefio_app/features/home/data/models/home_success_model/recipe_model.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item_body.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item_header.dart';
import 'package:flutter/material.dart';

class ProfileLikedRecipeItem extends StatelessWidget {
  const ProfileLikedRecipeItem({super.key, required this.recipeModel});
  final RecipeModel recipeModel;
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
        Expanded(child: RecipeItemBody(recipeBodyEntity: recipeModel)),
      ],
    );
  }
}

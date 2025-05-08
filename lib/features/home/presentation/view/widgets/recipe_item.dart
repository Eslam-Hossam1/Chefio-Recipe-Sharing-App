import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item_body.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item_header.dart';
import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({super.key, required this.recipeEntity});
  final RecipeEntity recipeEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecipeItemHeader(
          recipeEntity: recipeEntity,
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(child: RecipeItemBody(recipeBodyEntity: recipeEntity)),
      ],
    );
  }
}

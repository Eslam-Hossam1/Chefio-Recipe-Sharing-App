import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item.dart';
import 'package:flutter/material.dart';

class RecipesGrid extends StatelessWidget {
  const RecipesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.571,
          crossAxisSpacing: 25,
          mainAxisSpacing: 32),
      itemBuilder: (context, index) {
        return RecipeItem();
      },
    );
  }
}

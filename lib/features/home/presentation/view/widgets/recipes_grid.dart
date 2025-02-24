import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item.dart';
import 'package:flutter/material.dart';

class RecipesGrid extends StatelessWidget {
  const RecipesGrid({super.key,  this.crossAxisCount});
  final int? crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount??2,
          childAspectRatio: 0.571,
          crossAxisSpacing: 25,
          mainAxisSpacing: 32),
      itemBuilder: (context, index) {
        return RecipeItem();
      },
    );
  }
}

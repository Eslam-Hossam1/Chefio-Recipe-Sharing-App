
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_description.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_header.dart';
import 'package:flutter/material.dart';

class RecipeHeaderAndDescriptionSection extends StatelessWidget {
  const RecipeHeaderAndDescriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          RecipeHeader(),
          RecipeDescription(),
        ],
      ),
    );
  }
}

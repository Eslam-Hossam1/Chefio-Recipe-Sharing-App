import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_description.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeHeaderAndDescriptionSection extends StatelessWidget {
  const RecipeHeaderAndDescriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          RecipeDetailsHeader(
            recipeDetailsModel:
                context.read<RecipeDetailsCubit>().recipeDetailModel!,
          ),
          RecipeDescription(),
        ],
      ),
    );
  }
}

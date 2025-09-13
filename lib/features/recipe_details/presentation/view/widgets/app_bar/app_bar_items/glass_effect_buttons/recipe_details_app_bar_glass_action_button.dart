import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_actions_cubit/recipe_details_actions_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/app_bar/app_bar_items/glass_effect_buttons/edit_and_share_pop_up_menu_glass_button.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/app_bar/app_bar_items/glass_effect_buttons/share_glass_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetailsAppBarGlassActionButton extends StatefulWidget {
  const RecipeDetailsAppBarGlassActionButton({
    super.key,
  });

  @override
  State<RecipeDetailsAppBarGlassActionButton> createState() =>
      _RecipeDetailsAppBarGlassActionButtonState();
}

class _RecipeDetailsAppBarGlassActionButtonState
    extends State<RecipeDetailsAppBarGlassActionButton> {
  @override
  void initState() {
    //need to be modified not the final code
    final String recipeCreatorId =
        context.read<RecipeDetailsCubit>().recipeDetailModel!.createdBy.id;
    context
        .read<RecipeDetailsActionsCubit>()
        .checkIsMyRecipe(recipeCreatorId: recipeCreatorId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeDetailsActionsCubit, RecipeDetailsActionsState>(
      builder: (context, state) {
        if (state is MyRecipe) {
          return EditAndSharePopUpMenuGlassButton();
        } else {
          return ShareGlassButton();
        }
      },
    );
  }
}

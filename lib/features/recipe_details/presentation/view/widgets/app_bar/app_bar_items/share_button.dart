import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_actions_cubit/recipe_details_actions_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/app_bar/app_bar_items/glass_effect_buttons/custom_circle_glass_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ShareGlassButton extends StatelessWidget {
  const ShareGlassButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.read<RecipeDetailsActionsCubit>().shareRecipe(
              recipeId:
                  context.read<RecipeDetailsCubit>().recipeDetailModel!.id,
            );
      },
      child: SvgPicture.asset(
        Assets.imagesShare,
        colorFilter: ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

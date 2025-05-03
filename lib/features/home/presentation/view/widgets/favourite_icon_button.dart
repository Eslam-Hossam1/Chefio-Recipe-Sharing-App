import 'dart:ui';

import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe_model.dart';
import 'package:chefio_app/core/cubit/like_recipe_cubit/like_recipe_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/Glass_favourite_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({
    super.key,
    required this.recipeModel,
  });
  final RecipeModel recipeModel;
  @override
  State<FavouriteIconButton> createState() => _FavouriteIconButtonState();
}

class _FavouriteIconButtonState extends State<FavouriteIconButton> {
  late bool isLiked;
  @override
  void initState() {
    isLiked = widget.recipeModel.isLiked ?? false;
    super.initState();
  }

  void toggle() {
    setState(() {
      isLiked = !isLiked;
      context
          .read<LikeRecipeCubit>()
          .toggleLikeRecipe(recipeId: widget.recipeModel.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LikeRecipeCubit, LikeRecipeState>(
      listener: (context, state) {
        if (state is LikeRecipeFailed) {
          showCustomToast(context,
              message: state.errorLocalizationKey.tr(), seconds: 2);
        }
      },
      builder: (context, state) {
        if (state is LikeRecipeFailed &&
            state.recipeId == widget.recipeModel.id) {
          isLiked = !isLiked;
        }
        if (state is SyncLikeRecipeFromRecipeDetails &&
            state.recipeId == widget.recipeModel.id) {
          widget.recipeModel.isLiked = !widget.recipeModel.isLiked;
          isLiked = widget.recipeModel.isLiked;
        }
        return GestureDetector(
          onTap: () {
            toggle();
          },
          child: GlassFavouriteIcon(
            isFavourte: isLiked,
          ),
        );
      },
    );
  }
}

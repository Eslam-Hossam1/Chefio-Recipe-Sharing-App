import 'package:chefio_app/core/Entities/recipe_body_entity.dart';
import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/core/cubit/like_recipe_cubit/like_recipe_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/Glass_favourite_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({
    super.key,
    required this.recipeBodyEntity,
  });
  final RecipeBodyEntity recipeBodyEntity;
  @override
  State<FavouriteIconButton> createState() => _FavouriteIconButtonState();
}

class _FavouriteIconButtonState extends State<FavouriteIconButton> {
  late bool isLiked;
  @override
  void initState() {
    isLiked = widget.recipeBodyEntity.recipeIsLiked;
    super.initState();
  }

  void toggle() {
    setState(() {
      isLiked = !isLiked;
      context
          .read<LikeRecipeCubit>()
          .toggleLikeRecipe(recipeId: widget.recipeBodyEntity.recipeId);
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
            state.recipeId == widget.recipeBodyEntity.recipeId) {
          isLiked = !isLiked;
        }
        if (state is SyncLikeRecipeFromRecipeDetails &&
            state.recipeId == widget.recipeBodyEntity.recipeId) {
          widget.recipeBodyEntity.recipeIsLiked =
              !widget.recipeBodyEntity.recipeIsLiked;
          isLiked = widget.recipeBodyEntity.recipeIsLiked;
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

import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/core/cubit/like_recipe_cubit/like_recipe_cubit.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/likes_count_trigger.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_detail_circle_like_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailsCustomLike extends StatefulWidget {
  const RecipeDetailsCustomLike({
    super.key,
    required this.recipeDetailsModel,
  });
  final RecipeDetailsModel recipeDetailsModel;

  @override
  State<RecipeDetailsCustomLike> createState() =>
      _RecipeDetailsCustomLikeState();
}

class _RecipeDetailsCustomLikeState extends State<RecipeDetailsCustomLike> {
  late bool isLiked;
  late int likes;
  @override
  void initState() {
    isLiked = widget.recipeDetailsModel.isLiked!;
    likes = widget.recipeDetailsModel.likesCount;
    super.initState();
  }

  void toggleLike() {
    setState(() {
      toggleLikeUiFields();
      context.read<LikeRecipeCubit>().toggleLikeRecipe(
            recipeId: widget.recipeDetailsModel.id,
          );
      context.read<LikeRecipeCubit>().syncLikeRecipeFromRecipeDetails(
            recipeId: widget.recipeDetailsModel.id,
          );
    });
  }

  void toggleLikeUiFields() {
    likes = isLiked ? likes - 1 : likes + 1;
    isLiked = !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LikeRecipeCubit, LikeRecipeState>(
      listener: (context, state) {
        if (state is LikeRecipeFailed) {
          showCustomToast(context,
              message: state.errorLocalizationKey.tr(), seconds: 2);
        }
        // if (state is LikeRecipeSuccess) {
        //   context.read<LikeRecipeCubit>().syncLikeRecipeFromRecipeDetails(
        //         recipeId: widget.recipeDetailsModel.id,
        //       );
        // }
      },
      builder: (context, state) {
        if (state is LikeRecipeFailed &&
            state.recipeId == widget.recipeDetailsModel.id) {
          toggleLikeUiFields();
        }
        return Row(
          children: [
            GestureDetector(
              onTap: toggleLike,
              child: RecipeDetailsCircleLikeIcon(isLiked: isLiked),
            ),
            SizedBox(
              width: 8.w,
            ),
            LikesCountTrigger(
              likes: likes,
              recipeId: widget.recipeDetailsModel.id,
            ),
          ],
        );
      },
    );
  }
}

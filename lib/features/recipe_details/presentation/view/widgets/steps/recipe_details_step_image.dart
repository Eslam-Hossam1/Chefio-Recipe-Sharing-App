
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_step.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/steps/recipe_details_step_image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailsStepImage extends StatelessWidget {
  const RecipeDetailsStepImage({
    super.key,
    required this.recipeDetailsStep,
  });

  final RecipeDetailsStep recipeDetailsStep;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return RecipeDetailsStepImageDialog(
              url: recipeDetailsStep.stepImage!,
            );
          },
        );
      },
      child: Padding(
        padding:  EdgeInsets.only(top: 8.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 271 / 155,
            child: CustomCachedNetworkImage(
              url: recipeDetailsStep.stepImage!,
            ),
          ),
        ),
      ),
    );
  }
}

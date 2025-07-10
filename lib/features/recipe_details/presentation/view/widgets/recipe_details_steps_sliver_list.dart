import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_custom_divider.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_step_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailsStepsSliverList extends StatelessWidget {
  const RecipeDetailsStepsSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount:
          context.read<RecipeDetailsCubit>().recipeDetailModel!.steps.length,
      itemBuilder: (context, index) {
        return RecipeDetailsStepItem(
          stepIndex: index,
        );
      },
      separatorBuilder: (context, index) {
        return RecipeDetailsCustomDivider(
          height: 48.h,
        );
      },
      // separatorBuilder: (context, index) {
      //   return SizedBox(
      //     height: 24.h,
      //   );
      // },
    );
  }
}

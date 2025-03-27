
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_custom_divider.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_step_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailsStepsSliverList extends StatelessWidget {
  const RecipeDetailsStepsSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
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
    );
  }
}

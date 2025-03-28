import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_detail_model.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_app_bar_action_button.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailsAppBarItems extends StatelessWidget {
  const RecipeDetailsAppBarItems({
    super.key,
    required this.collapseRatio,
  });

  final double collapseRatio;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RecipeDetailsBackButton(),
        SizedBox(
          width: 12.w,
        ),
        // Recipe Title: Appears when the AppBar is collapsed

        Expanded(
          child: AnimatedOpacity(
            opacity: collapseRatio <= 0.3 ? 1.0 : 0.0, // Show when collapsed
            duration: Duration(milliseconds: 300),
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
             context.read<RecipeDetailsCubit>().recipeDetailModel!.foodName,
              style: Styles.textStyleBold17(context).copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        RecipeDetailsAppBarActionButton(),
      ],
    );
  }
}

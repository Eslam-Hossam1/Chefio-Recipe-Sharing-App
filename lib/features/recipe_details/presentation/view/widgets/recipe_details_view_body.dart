import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/custom_bold_17_title.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_custom_divider.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/ingredents/recipe_details_ingredients_sliver_list.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/steps/recipe_details_steps_sliver_list.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_header_and_description_section.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/app_bar/recipe_details_custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailsViewBody extends StatelessWidget {
  const RecipeDetailsViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        RecipeDetailsCustomAppBar(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 8,
          ),
        ),
        SliverAdaptivePadding(
          sliver: RecipeHeaderAndDescriptionSection(),
        ),
        SliverToBoxAdapter(
          child: AdaptivePadding(
            child: CustomBold17Title(
              text: AppLocalizationKeys.global.ingredients.tr(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16.h,
          ),
        ),
        SliverAdaptivePadding(
          sliver: RecipeDetailsIngredientsSliverList(),
        ),
        SliverToBoxAdapter(child: RecipeDetailsCustomDivider()),
        SliverToBoxAdapter(
          child: AdaptivePadding(
            child: CustomBold17Title(
              text: AppLocalizationKeys.global.steps.tr(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 18.h,
          ),
        ),
        SliverAdaptivePadding(
          sliver: RecipeDetailsStepsSliverList(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 60.h,
          ),
        ),
      ],
    );
  }
}

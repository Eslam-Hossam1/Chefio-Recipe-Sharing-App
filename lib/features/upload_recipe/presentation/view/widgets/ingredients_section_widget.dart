import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/add_ingredient_button.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/animated_add_ingredients_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IngredientsSection extends StatelessWidget {
  const IngredientsSection({
    super.key,
    required this.ingredientItemsKeys,
    required this.ingredientsAnimatedListKey,
    required this.ingredientsFocusNodes,
  });

  final List<GlobalKey> ingredientItemsKeys;
  final GlobalKey<SliverAnimatedListState> ingredientsAnimatedListKey;
  final List<FocusNode> ingredientsFocusNodes;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        // Section Title
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  AppLocalizationKeys.global.ingredients.tr(),
                  style: Styles.textStyleBold17(context).copyWith(
                    color: context.mainTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Spacing
        SliverToBoxAdapter(child: SizedBox(height: 36.h)),

        // Ingredients List
        SliverAdaptivePadding(
          sliver: AnimatedAddIngredientsList(
            ingredientItemsKeys: ingredientItemsKeys,
            animatedListKey: ingredientsAnimatedListKey,
            focusNodes: ingredientsFocusNodes,
          ),
        ),

        // Spacing
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),

        // Add Ingredient Button
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: AddIngredintButton(
              ingredientsFocusNodes: ingredientsFocusNodes,
              ingredientsItemKeys: ingredientItemsKeys,
              ingredientsAnimatedListKey: ingredientsAnimatedListKey,
            ),
          ),
        ),
      ],
    );
  }
}

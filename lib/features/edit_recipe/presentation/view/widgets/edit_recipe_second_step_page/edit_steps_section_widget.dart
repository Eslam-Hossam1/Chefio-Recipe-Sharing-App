import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_second_step_page/edit_recipe_add_step_button.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_second_step_page/animated_edit_steps_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditStepsSection extends StatelessWidget {
  const EditStepsSection({
    super.key,
    required this.stepsItemKeys,
    required this.stepsAnimatedListKey,
    required this.stepsFocusNodes,
    required this.scrollController,
  });

  final List<GlobalKey> stepsItemKeys;
  final GlobalKey<SliverAnimatedListState> stepsAnimatedListKey;
  final List<FocusNode> stepsFocusNodes;
  final ScrollController scrollController;

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
                  AppLocalizationKeys.global.steps.tr(),
                  style: Styles.textStyleBold17(context).copyWith(
                    color: context.mainTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Spacing
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),

        // Steps List
        SliverAdaptivePadding(
          sliver: AnimatedEditStepsList(
            stepItemsKeys: stepsItemKeys,
            animatedListKey: stepsAnimatedListKey,
            focusNodes: stepsFocusNodes,
          ),
        ),

        // Spacing
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),

        // Add Step Button
        SliverAdaptivePadding(
          sliver: SliverToBoxAdapter(
            child: EditRecipeAddStepButton(
              stepsAnimatedListKey: stepsAnimatedListKey,
              scrollController: scrollController,
              stepsFocusNodes: stepsFocusNodes,
              stepsItemKeys: stepsItemKeys,
            ),
          ),
        ),
      ],
    );
  }
}

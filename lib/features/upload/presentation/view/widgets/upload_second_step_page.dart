import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/upload/presentation/manager/cubit/add_ingredients_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/add_ingredient_button.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/add_step_button.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/animated_add_ingredients_list.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/animated_add_steps_list.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/back_and_next_buttons.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/enter_step_item.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/sliver_uplaod_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadSecondStepPage extends StatefulWidget {
  const UploadSecondStepPage({super.key});

  @override
  State<UploadSecondStepPage> createState() => _UploadSecondStepPageState();
}

class _UploadSecondStepPageState extends State<UploadSecondStepPage> {
  List<int> ingredients = [1];
  GlobalKey<SliverAnimatedListState> ingredientsAnimatedListKey =
      GlobalKey<SliverAnimatedListState>();

  List<int> steps = [1];
  GlobalKey<SliverAnimatedListState> stepsAnimatedListKey =
      GlobalKey<SliverAnimatedListState>();

  void addIngerdient() {
    ingredients.add(1);
    ingredientsAnimatedListKey.currentState!.insertItem(ingredients.length - 1);
  }

  void addStep() {
    steps.add(1);
    stepsAnimatedListKey.currentState!.insertItem(steps.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return AdaptivePadding(
      top: 12,
      child: CustomScrollView(
        slivers: [
          SliverUploadHeader(
            currentStep: '2',
            steps: '2',
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 47.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizationKeys.global.ingredients.tr(),
                style: Styles.textStyleBold17(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 36.h,
            ),
          ),
          AnimatedAddIngredientsList(
            ingredientsList: ingredients,
            animatedListKey: ingredientsAnimatedListKey,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.h,
            ),
          ),
          SliverToBoxAdapter(
            child: AddIngredintButton(
              onPressed: addIngerdient,
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              height: 48,
              thickness: 8,
              color: context.formColor,
            ),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizationKeys.global.steps.tr(),
                style: Styles.textStyleBold17(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
          AnimatedAddStepsList(
            stepsList: steps,
            animatedListKey: stepsAnimatedListKey,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
          SliverToBoxAdapter(
            child: AddStepButton(
              onPressed: addStep,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: BackAndNextButtons(),
          ),
        ],
      ),
    );
  }
}

import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_recipe_cubit/upload_recipe_cubit.dart';
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
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadSecondStepPage extends StatefulWidget {
  const UploadSecondStepPage({super.key, required this.onBack});
  final VoidCallback onBack;
  @override
  State<UploadSecondStepPage> createState() => _UploadSecondStepPageState();
}

class _UploadSecondStepPageState extends State<UploadSecondStepPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<SliverAnimatedListState> ingredientsAnimatedListKey =
      GlobalKey<SliverAnimatedListState>();
  final GlobalKey<SliverAnimatedListState> stepsAnimatedListKey =
      GlobalKey<SliverAnimatedListState>();
  final List<GlobalKey> ingredientsItemKeys = [GlobalKey(), GlobalKey()];
  final List<GlobalKey> stepsItemKeys = [GlobalKey(), GlobalKey()];

  final ScrollController scrollController = ScrollController();
  final List<FocusNode> ingredientsFocusNodes = [FocusNode(), FocusNode()];
  final List<FocusNode> stepsFocusNodes = [FocusNode(), FocusNode()];

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void enableAutoValidation() {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
  }

  void _addIngredientAndFocus() {
    final cubit = context.read<UploadRecipeCubit>();
    cubit.addIngerdient(ingredientsAnimatedListKey: ingredientsAnimatedListKey);
    ingredientsFocusNodes.add(FocusNode());
    ingredientsItemKeys.add(GlobalKey());

    Future.delayed(const Duration(milliseconds: 300), () {
      final contextToScroll = ingredientsItemKeys.last.currentContext;
      if (contextToScroll != null) {
        Scrollable.ensureVisible(
          contextToScroll,
          duration: const Duration(milliseconds: 500),
          alignment: .4, // closer to top
          curve: Curves.easeInOut,
        );
      }
      ingredientsFocusNodes.last.requestFocus();
    });
  }

  void _addStepAndFocus() async {
    final cubit = context.read<UploadRecipeCubit>();
    cubit.addStep(stepsAnimatedListKey: stepsAnimatedListKey);
    stepsFocusNodes.add(FocusNode());
    stepsItemKeys.add(GlobalKey());

    Future.delayed(const Duration(milliseconds: 300), () async {
      final contextToScroll = stepsItemKeys.last.currentContext;
      if (contextToScroll != null) {
        Scrollable.ensureVisible(
          contextToScroll,
          duration: const Duration(milliseconds: 500),
          alignment: 0.4,
          curve: Curves.easeInOut,
        );
        // Step 2: Wait for rendering to settle
        await Future.delayed(const Duration(milliseconds: 100));

        // Step 3: Check if the item is fully visible
        final renderBox = contextToScroll.findRenderObject() as RenderBox;
        final offset = renderBox.localToGlobal(Offset.zero);
        final bottomOfItem = offset.dy + renderBox.size.height;
        final screenHeight = MediaQuery.of(contextToScroll).size.height;

        // If the bottom of the item is still outside the screen, scroll to bottom
        if (bottomOfItem > screenHeight) {
          await scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
      stepsFocusNodes.last.requestFocus();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    for (final node in ingredientsFocusNodes) {
      node.dispose();
    }
    for (final node in stepsFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<UploadRecipeCubit, UploadRecipeState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UploadRecipeLoading,
          child: AdaptivePadding(
            top: 12,
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  const SliverUploadHeader(
                    currentStep: '2',
                    steps: '2',
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 47.h)),
                  SliverToBoxAdapter(
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
                  SliverToBoxAdapter(child: SizedBox(height: 36.h)),
                  AnimatedAddIngredientsList(
                    ingredientItemsKeys: ingredientsItemKeys,
                    animatedListKey: ingredientsAnimatedListKey,
                    focusNodes: ingredientsFocusNodes,
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child: AddIngredintButton(
                      onPressed: _addIngredientAndFocus,
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
                  SliverToBoxAdapter(child: SizedBox(height: 24.h)),
                  AnimatedAddStepsList(
                    stepItemsKeys: stepsItemKeys,
                    animatedListKey: stepsAnimatedListKey,
                    focusNodes: stepsFocusNodes,
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 24.h)),
                  SliverToBoxAdapter(
                    child: AddStepButton(
                      onPressed: _addStepAndFocus,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: BackAndNextButtons(
                      onBack: widget.onBack,
                      formKey: formKey,
                      enableAutoValidation: enableAutoValidation,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

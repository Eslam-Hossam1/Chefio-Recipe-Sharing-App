import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/sliver_set_recipe_header.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_form_model.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_submit_cubit/edit_recipe_submit_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_add_step_button.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/animated_edit_steps_list.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_add_ingredient_button.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/animated_edit_ingredients_list.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_back_and_submit_buttons.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_success_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

part 'edit_recipe_form_data.dart';

class EditRecipeSecondStepPage extends StatefulWidget {
  const EditRecipeSecondStepPage({super.key, required this.onBack});
  final VoidCallback onBack;
  @override
  State<EditRecipeSecondStepPage> createState() =>
      _EditRecipeSecondStepPageState();
}

class _EditRecipeSecondStepPageState extends State<EditRecipeSecondStepPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late final EditRecipeFormData formData;
  @override
  void initState() {
    super.initState();
    EditRecipeFormModel editRecipeFormModel =
        context.read<EditRecipeFormCubit>().editRecipeFormModel;
    formData = EditRecipeFormData(
      ingredientsLength: editRecipeFormModel.ingredients.length,
      stepsLength: editRecipeFormModel.steps.length,
    );
  }

  @override
  void dispose() {
    formData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<EditRecipeSubmitCubit, EditRecipeSubmitState>(
      listener: (context, state) {
        if (state is EditRecipeSubmitFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalizationKey.tr(),
          );
        } else if (state is EditRecipeSubmitSuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return EditRecipeSuccessDialog();
            },
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is EditRecipeSubmitLoading,
          child: AdaptivePadding(
            top: 12,
            child: Form(
              key: formData.formKey,
              autovalidateMode: formData.autovalidateMode,
              child: CustomScrollView(
                controller: formData.scrollController,
                slivers: [
                  const SliverSetRecipeHeader(
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
                  AnimatedEditIngredientsList(
                    ingredientItemsKeys: formData.ingredientsItemKeys,
                    animatedListKey: formData.ingredientsAnimatedListKey,
                    focusNodes: formData.ingredientsFocusNodes,
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child: EditRecipeAddIngredintButton(
                      ingredientsFocusNodes: formData.ingredientsFocusNodes,
                      ingredientsItemKeys: formData.ingredientsItemKeys,
                      ingredientsAnimatedListKey:
                          formData.ingredientsAnimatedListKey,
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
                  AnimatedEditStepsList(
                    stepItemsKeys: formData.stepsItemKeys,
                    animatedListKey: formData.stepsAnimatedListKey,
                    focusNodes: formData.stepsFocusNodes,
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 24.h)),
                  SliverToBoxAdapter(
                    child: EditRecipeAddStepButton(
                      stepsAnimatedListKey: formData.stepsAnimatedListKey,
                      scrollController: formData.scrollController,
                      stepsFocusNodes: formData.stepsFocusNodes,
                      stepsItemKeys: formData.stepsItemKeys,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: EditRecipeBackAndSubmitButtons(
                      onBack: widget.onBack,
                      formKey: formData.formKey,
                      enableAutoValidation: formData.enableAutoValidation,
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

import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/core/widgets/sliver_set_recipe_header.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_form_model.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_submit_cubit/edit_recipe_submit_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_second_step_page/edit_ingredients_section_widget.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_second_step_page/edit_section_divider_widget.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_second_step_page/edit_steps_section_widget.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_second_step_page/edit_recipe_back_and_submit_buttons.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_second_step_page/edit_recipe_success_dialog.dart';
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
          child: Form(
            key: formData.formKey,
            autovalidateMode: formData.autovalidateMode,
            child: CustomScrollView(
              controller: formData.scrollController,
              slivers: [
                SliverAdaptivePadding(
                  sliver: const SliverSetRecipeHeader(
                    currentStep: '2',
                    steps: '2',
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 47.h)),

                // Ingredients Section
                EditIngredientsSection(
                  ingredientItemsKeys: formData.ingredientsItemKeys,
                  ingredientsAnimatedListKey:
                      formData.ingredientsAnimatedListKey,
                  ingredientsFocusNodes: formData.ingredientsFocusNodes,
                ),
                // Section Divider
                const EditSectionDivider(),

                // Steps Section
                EditStepsSection(
                  stepsItemKeys: formData.stepsItemKeys,
                  stepsAnimatedListKey: formData.stepsAnimatedListKey,
                  stepsFocusNodes: formData.stepsFocusNodes,
                  scrollController: formData.scrollController,
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: AdaptivePadding(
                    child: EditRecipeBackAndSubmitButtons(
                      onBack: widget.onBack,
                      formKey: formData.formKey,
                      enableAutoValidation: formData.enableAutoValidation,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

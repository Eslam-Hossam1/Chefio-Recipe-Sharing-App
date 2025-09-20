import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/core/widgets/sliver_set_recipe_header.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_recipe_submit_cubit/upload_recipe_submit_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/ingredients_section_widget.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/upload_section_divider_widget.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/steps_section_widget.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/upload_recipe_back_and_buttons_buttons.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/upload_success_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

part 'upload_form_data.dart';

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

  final UploadFormData formData = UploadFormData();

  @override
  void dispose() {
    formData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<UploadRecipeSubmitCubit, UploadRecipeSubmitState>(
      listener: (context, state) {
        if (state is UploadSubmitFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalizationKey.tr(),
          );
        } else if (state is UploadSubmitSuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return UploadRecipeSuccessDialog();
            },
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UploadSubmitLoading,
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
                IngredientsSection(
                  ingredientItemsKeys: formData.ingredientsItemKeys,
                  ingredientsAnimatedListKey:
                      formData.ingredientsAnimatedListKey,
                  ingredientsFocusNodes: formData.ingredientsFocusNodes,
                ),
                // Section Divider
                const UploadSectionDivider(),

                // Steps Section
                StepsSection(
                  stepsItemKeys: formData.stepsItemKeys,
                  stepsAnimatedListKey: formData.stepsAnimatedListKey,
                  stepsFocusNodes: formData.stepsFocusNodes,
                  scrollController: formData.scrollController,
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: AdaptivePadding(
                    child: UploadRecipeBackAndSubmitButtons(
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

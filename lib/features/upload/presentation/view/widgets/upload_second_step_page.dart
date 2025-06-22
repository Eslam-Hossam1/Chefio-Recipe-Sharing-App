import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_submit_cubit/upload_submit_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/add_ingredient_button.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/add_step_button.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/animated_add_ingredients_list.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/animated_add_steps_list.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/back_and_next_buttons.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/sliver_uplaod_header.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/upload_success_dialog.dart';
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
    return BlocConsumer<UploadSubmitCubit, UploadSubmitState>(
      listener: (context,state){
        if (state is UploadSubmitFailure) {
            DialogHelper.showErrorDialog(
              context,
              errorMessage: state.errorLocalizationKey.tr(),
            );
          } else if (state is UploadSubmitSuccess) {
            showDialog(
              context: context,
              builder: (context) {
                return SetRecipeSuccessDialog();
              },
            );
          }
        },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UploadSubmitLoading,
          child: AdaptivePadding(
            top: 12,
            child: Form(
              key: formData.formKey,
              autovalidateMode: formData.autovalidateMode,
              child: CustomScrollView(
                controller: formData.scrollController,
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
                    ingredientItemsKeys: formData.ingredientsItemKeys,
                    animatedListKey: formData.ingredientsAnimatedListKey,
                    focusNodes: formData.ingredientsFocusNodes,
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child: AddIngredintButton(
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
                  AnimatedAddStepsList(
                    stepItemsKeys: formData.stepsItemKeys,
                    animatedListKey: formData.stepsAnimatedListKey,
                    focusNodes: formData.stepsFocusNodes,
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 24.h)),
                  SliverToBoxAdapter(
                    child: AddStepButton(
                      stepsAnimatedListKey: formData.stepsAnimatedListKey,
                      scrollController: formData.scrollController,
                      stepsFocusNodes: formData.stepsFocusNodes,
                      stepsItemKeys: formData.stepsItemKeys,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: BackAndNextButtons(
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

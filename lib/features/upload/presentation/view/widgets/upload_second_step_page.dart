import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<SliverAnimatedListState> ingredientsAnimatedListKey =
      GlobalKey<SliverAnimatedListState>();

  GlobalKey<SliverAnimatedListState> stepsAnimatedListKey =
      GlobalKey<SliverAnimatedListState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void enableAutoValidation() {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
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
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 36.h,
                    ),
                  ),
                  AnimatedAddIngredientsList(
                    animatedListKey: ingredientsAnimatedListKey,
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AddIngredintButton(
                      onPressed: () {
                        context.read<UploadRecipeCubit>().addIngerdient(
                            ingredientsAnimatedListKey:
                                ingredientsAnimatedListKey);
                      },
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
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 24.h,
                    ),
                  ),
                  AnimatedAddStepsList(
                    animatedListKey: stepsAnimatedListKey,
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 24.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AddStepButton(
                      onPressed: () {
                        context.read<UploadRecipeCubit>().addStep(
                            stepsAnimatedListKey: stepsAnimatedListKey);
                      },
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

import 'package:chefio_app/core/Functions/form_validators.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/step_image_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterStepItem extends StatelessWidget {
  const EnterStepItem({
    super.key,
    required this.stepIndex,
    required this.focusNode,
  });

  final int stepIndex;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: context.mainTextColor,
              child: Text(
                '${stepIndex + 1}',
                style: Styles.textStyleBold12(context).copyWith(
                  color: context.scaffoldBackgroundColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Icon(
              Icons.drag_indicator,
              color: context.secondaryTextColor,
              size: 24,
            ),
          ],
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            children: [
              CustomTextFormField(
                focusNode: focusNode,
                validator: (value) =>
                    FormValidators.requiredNumberOfCharacters(value, 2),
                initialValue:
                    context.read<EditRecipeFormCubit>().steps[stepIndex],
                onSaved: (step) {
                  context.read<EditRecipeFormCubit>().steps[stepIndex] = step!;
                },
                onChanged: (stepChange) {
                  context.read<EditRecipeFormCubit>().steps[stepIndex] =
                      stepChange;
                },
                hint: AppLocalizationKeys.upload.stepHint.tr(),
                borderRadius: 8,
                maxLines: 4,
              ),
              SizedBox(height: 8.h),
              StepImageManager(
                index: stepIndex,
                recipeDetailsModel:
                    context.read<EditRecipeFormCubit>().recipeDetailsModel,
              )
            ],
          ),
        ),
      ],
    );
  }
}

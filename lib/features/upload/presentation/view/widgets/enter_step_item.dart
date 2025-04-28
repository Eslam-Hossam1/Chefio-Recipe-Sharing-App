import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_recipe_cubit/upload_recipe_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/add_step_photo_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterStepItem extends StatelessWidget {
  const EnterStepItem({
    super.key,
    required this.stepIndex,
  });
  final int stepIndex;
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
            SizedBox(
              height: 16,
            ),
            Icon(
              Icons.drag_indicator,
              color: context.secondaryTextColor,
              size: 24,
            ),
          ],
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Column(
            children: [
              CustomTextFormField(
                initialValue:
                    context.read<UploadRecipeCubit>().steps[stepIndex],
                onSaved: (step) {
                  // cubit.ingredints[stepIndex].stepText=value;
                  // cubit.ingredints[stepIndex].image=selectedImage;
                  context.read<UploadRecipeCubit>().steps[stepIndex] = step!;
                },
                onChanged: (stepChange) {
                  context.read<UploadRecipeCubit>().steps[stepIndex] =
                      stepChange;
                },
                hint: AppLocalizationKeys.upload.stepHint.tr(),
                borderRadius: 8,
                maxLines: 4,
              ),
              SizedBox(
                height: 8.h,
              ),
              // AddStepPhotoButton(selectedImage),
              AddStepPhotoButton(),
            ],
          ),
        ),
      ],
    );
  }
}

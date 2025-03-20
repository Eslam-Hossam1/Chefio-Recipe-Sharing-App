import 'dart:developer';

import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_recipe_cubit/upload_recipe_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackAndNextButtons extends StatelessWidget {
  const BackAndNextButtons(
      {super.key,
      required this.onBack,
      required this.formKey,
      required this.enableAutoValidation});
  final VoidCallback onBack;
  final GlobalKey<FormState> formKey;
  final VoidCallback enableAutoValidation;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h, top: 24.h),
        child: Row(
          children: [
            Expanded(
              child: CustomTextButton(
                onPressed: onBack,
                backgroundColor: context.formColor,
                child: Text(
                  AppLocalizationKeys.global.back.tr(),
                  style: Styles.textStyleBold15(context)
                      .copyWith(color: context.mainTextColor),
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: CustomTextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log(context
                        .read<UploadRecipeCubit>()
                        .ingredients
                        .toString());
                    log(context.read<UploadRecipeCubit>().steps.toString());
                  } else {
                    enableAutoValidation();

                    log('not valid in second step');
                  }
                },
                child: Text(
                  AppLocalizationKeys.global.next.tr(),
                  style: Styles.textStyleBold15(context)
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

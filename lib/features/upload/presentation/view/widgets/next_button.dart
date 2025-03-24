import 'dart:developer';

import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_recipe_cubit/upload_recipe_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.onNext,
    required this.formKey,
    required this.enableAutoValidation,
  });
  final VoidCallback onNext;
  final GlobalKey<FormState> formKey;
  final VoidCallback enableAutoValidation;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: CustomTextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              if (context.read<UploadRecipeCubit>().validateImage()) {
                DialogHelper.showErrorDialog(context,
                    errorMessage: 'image requried');
              } else {
                onNext();
              }
            } else {
              enableAutoValidation();
              log('not valid in first step');
            }
          },
          width: double.infinity,
          child: Text(
            AppLocalizationKeys.global.next.tr(),
            style:
                Styles.textStyleBold15(context).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

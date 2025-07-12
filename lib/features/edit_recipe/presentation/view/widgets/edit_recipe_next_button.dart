import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditRecipeNextButton extends StatelessWidget {
  const EditRecipeNextButton({
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
              onNext();
            } else {
              enableAutoValidation();
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

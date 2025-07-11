import 'package:chefio_app/features/upload/presentation/view/widgets/upload_recipe_back_button.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/upload_recipe_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadRecipeBackAndSubmitButtons extends StatelessWidget {
  const UploadRecipeBackAndSubmitButtons(
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
              child: UploadRecipeBackButton(onBack: onBack),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: UploadRecipeSubmitButton(
                  formKey: formKey, enableAutoValidation: enableAutoValidation),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chefio_app/core/widgets/set_recipe_back_button.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/upload_recipe_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditRecipeBackAndSubmitButtons extends StatelessWidget {
  const EditRecipeBackAndSubmitButtons(
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
              child: SetRecipeBackButton(onBack: onBack),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: EditRecipeSubmitButton(
                  formKey: formKey, enableAutoValidation: enableAutoValidation),
            ),
          ],
        ),
      ),
    );
  }
}

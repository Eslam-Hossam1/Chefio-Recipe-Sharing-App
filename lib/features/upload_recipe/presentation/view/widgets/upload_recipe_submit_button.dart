import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/upload_recipe/data/models/upload_recipe_model.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_recipe_form_cubit/upload_recipe_form_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_recipe_submit_cubit/upload_recipe_submit_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadRecipeSubmitButton extends StatelessWidget {
  const UploadRecipeSubmitButton({
    super.key,
    required this.formKey,
    required this.enableAutoValidation,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback enableAutoValidation;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();

          uploadRecipe(context);
        } else {
          enableAutoValidation();
        }
      },
      child: Text(
        AppLocalizationKeys.global.submit.tr(),
        style: Styles.textStyleBold15(context).copyWith(color: Colors.white),
      ),
    );
  }

  void uploadRecipe(BuildContext context) {
    UploadRecipeFormCubit uploadFormCubit =
        context.read<UploadRecipeFormCubit>();
    UploadRecipeSubmitCubit uploadSubmitCubit =
        context.read<UploadRecipeSubmitCubit>();

    UploadRecipeModel uploadRecipeModel =
        UploadRecipeModel.fromEditRecipeFormModel(
      uploadRecipeFormModel: uploadFormCubit.uploadRecipeFormModel,
    );

    uploadSubmitCubit.uploadRecipe(
      uploadRecipeModel: uploadRecipeModel,
    );
  }
}

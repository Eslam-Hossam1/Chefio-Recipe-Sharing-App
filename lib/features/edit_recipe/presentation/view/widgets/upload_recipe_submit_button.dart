import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/upload/data/models/edit_recipe_model.dart';
import 'package:chefio_app/features/upload/data/models/upload_recipe_model.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_form_cubit/upload_form_cubit.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_submit_cubit/upload_submit_cubit.dart';
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
          UploadFormCubit uploadFormCubit = context.read<UploadFormCubit>();
          UploadSubmitCubit uploadSubmitCubit =
              context.read<UploadSubmitCubit>();

          bool isEdit = uploadFormCubit.isEdit;

          if (isEdit) {
            editRecipe(uploadFormCubit, uploadSubmitCubit);
          } else {
            uploadRecipe(uploadFormCubit, uploadSubmitCubit);
          }
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

  void uploadRecipe(
      UploadFormCubit uploadFormCubit, UploadSubmitCubit uploadSubmitCubit) {
    UploadRecipeModel uploadRecipeModel =
        uploadFormCubit.getUploadRecipeModel();
    uploadSubmitCubit.uploadRecipe(
      uploadRecipeModel: uploadRecipeModel,
    );
  }

  void editRecipe(
      UploadFormCubit uploadFormCubit, UploadSubmitCubit uploadSubmitCubit) {
    EditRecipeModel editRecipeModel = uploadFormCubit.getEditRecipeModel();
    uploadSubmitCubit.editRecipe(
      editRecipeModel: editRecipeModel,
    );
  }
}

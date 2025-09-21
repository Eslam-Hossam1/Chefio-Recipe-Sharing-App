import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_form_model.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_model.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_submit_cubit/edit_recipe_submit_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditRecipeSubmitButton extends StatelessWidget {
  const EditRecipeSubmitButton({
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

          editRecipe(context);
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

  void editRecipe(BuildContext context) {
    EditRecipeFormModel editRecipeFormModel =
        context.read<EditRecipeFormCubit>().editRecipeFormModel;
    EditRecipeSubmitCubit editSubmitCubit =
        context.read<EditRecipeSubmitCubit>();

    EditRecipeModel editRecipeModel = EditRecipeModel.fromEditRecipeFormModel(
        editRecipeFormModel: editRecipeFormModel);
    editSubmitCubit.editRecipe(
      editRecipeModel: editRecipeModel,
    );
  }
}

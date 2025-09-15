import 'package:chefio_app/core/Functions/form_validators.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_form_model.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditEnterIngredientItem extends StatelessWidget {
  const EditEnterIngredientItem({
    super.key,
    required this.ingredientIndex,
    required this.focusNode,
  });

  final int ingredientIndex;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    EditRecipeFormModel editRecipeFormModel =
        context.read<EditRecipeFormCubit>().editRecipeFormModel;
    return Row(
      children: [
        Icon(
          Icons.drag_indicator,
          color: context.secondaryTextColor,
          size: 24,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: CustomTextFormField(
            focusNode: focusNode,
            validator: (value) =>
                FormValidators.requiredNumberOfCharacters(value, 2),
            initialValue:
                editRecipeFormModel.ingredients[ingredientIndex],
            onSaved: (ingredient) {
              editRecipeFormModel.ingredients[ingredientIndex] =
                  ingredient!.trim();
            },
            onChanged: (ingredientChange) {
              editRecipeFormModel.ingredients[ingredientIndex] =
                  ingredientChange.trim();
            },
            hint: AppLocalizationKeys.upload.enterIngredient.tr(),
          ),
        ),
      ],
    );
  }
}

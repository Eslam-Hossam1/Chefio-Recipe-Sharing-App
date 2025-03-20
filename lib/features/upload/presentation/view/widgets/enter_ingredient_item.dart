import 'package:chefio_app/core/Functions/form_validators.dart';
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_recipe_cubit/upload_recipe_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterIngredientItem extends StatelessWidget {
  const EnterIngredientItem({
    super.key,
    required this.ingredientIndex,
  });
  final int ingredientIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.drag_indicator,
          color: context.secondaryTextColor,
          size: 24,
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: CustomTextFormField(
            initialValue:
                context.read<UploadRecipeCubit>().ingredients[ingredientIndex],
            onSaved: (ingredient) {
              context.read<UploadRecipeCubit>().ingredients[ingredientIndex] =
                  ingredient!;
            },
            onChanged: (ingredientChange) {
              context.read<UploadRecipeCubit>().ingredients[ingredientIndex] =
                  ingredientChange;
            },
            hint: AppLocalizationKeys.upload.enterIngredient.tr(),
          ),
        ),
      ],
    );
  }
}

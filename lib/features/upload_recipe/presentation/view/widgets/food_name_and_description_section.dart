import 'package:chefio_app/core/Functions/form_validators.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:chefio_app/features/upload_recipe/data/models/upload_recipe_form_model.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_form_cubit/upload_form_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodNameAndDescriptionSection extends StatelessWidget {
  const FoodNameAndDescriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        final UploadRecipeFormModel uploadRecipeFormModel =
        context.read<UploadFormCubit>().uploadRecipeFormModel;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizationKeys.upload.foodName.tr(),
            style: Styles.textStyleBold17(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            validator: (value) =>
                FormValidators.requiredNumberOfCharacters(value, 2),
            initialValue: uploadRecipeFormModel.foodName,
            onSaved: (foodName) {
              uploadRecipeFormModel.foodName = foodName!;
            },
            hint: AppLocalizationKeys.upload.enterFoodName.tr(),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            AppLocalizationKeys.upload.description.tr(),
            style: Styles.textStyleBold17(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            validator: (value) =>
                FormValidators.requiredNumberOfCharacters(value, 3),
            initialValue: uploadRecipeFormModel.foodDescription,
            onSaved: (foodDescription) {
             uploadRecipeFormModel.foodDescription =
                  foodDescription!;
            },
            hint: AppLocalizationKeys.upload.descriptionHint.tr(),
            borderRadius: 8,
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}

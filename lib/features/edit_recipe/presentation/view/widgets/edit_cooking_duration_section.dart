import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_cooking_duration_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCookingDurationSection extends StatelessWidget {
  const EditCookingDurationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${AppLocalizationKeys.upload.cookingDuration.tr()} ',
                style: Styles.textStyleBold17(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
              Text(
                AppLocalizationKeys.upload.inMinutes.tr(),
                style: Styles.textStyleBold17(context).copyWith(
                  color: context.secondaryTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          EditCookingDurationSlider(
            initialCurrentValue:
                context.read<EditRecipeFormCubit>().editRecipeFormModel.foodCookDuration,
                onChangeEnd: (cookDuration) {
              context.read<EditRecipeFormCubit>().editRecipeFormModel.foodCookDuration =
                  cookDuration.toInt();
            },
          ),
        ],
      ),
    );
  }
}

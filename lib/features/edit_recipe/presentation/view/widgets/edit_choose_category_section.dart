import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_form_model.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/categories_listview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditChooseCategorySection extends StatelessWidget {
  const EditChooseCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    EditRecipeFormModel editRecipeFormModel =
        context.read<EditRecipeFormCubit>().editRecipeFormModel;
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizationKeys.global.category.tr(),
            style: Styles.textStyleBold17(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          CategoriesListView(
            applyPadding: false,
            categories: context.read<EditRecipeFormCubit>().categories,
            onCategoryPressed: (category) {
              editRecipeFormModel.categoryId = category.id;
            },
          )
        ],
      ),
    );
  }
}

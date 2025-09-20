import 'dart:developer';

import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/categories_listview.dart';
import 'package:chefio_app/features/upload_recipe/data/models/upload_recipe_form_model.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_recipe_form_cubit/upload_recipe_form_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadChooseCategorySection extends StatelessWidget {
  const UploadChooseCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final UploadRecipeFormModel uploadRecipeFormModel =
        context.read<UploadRecipeFormCubit>().uploadRecipeFormModel;

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
            categories: context.read<UploadRecipeFormCubit>().categories,
            onCategoryPressed: (category) {
              log("uploadRecipeFormModel.categoryId = ${uploadRecipeFormModel.categoryId} , category.id= ${category.id}");
              uploadRecipeFormModel.categoryId = category.id;
            },
          )
        ],
      ),
    );
  }
}

import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/manager/home_categories_cubit/home_categories_cubit.dart';
import 'package:chefio_app/features/home/presentation/manager/home_recipes_cubit/home_recipes_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/categories_listview.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_text_error_message.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/skeletonizer_categories_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCategoriesBuilder extends StatelessWidget {
  const HomeCategoriesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCategoriesCubit, HomeCategoriesState>(
      builder: (context, state) {
        if (state is HomeCategoriesFailure) {
          return CustomTextErrorMessage(text: state.errorLocalizationKey.tr());
        } else if (state is HomeCategoriesLoading) {
          return SkeletonizerCategoriesListView();
        } else {
          return CategoriesListView(
            key: ValueKey(
                context.read<HomeCategoriesCubit>().categories.hashCode),
            categories: context.read<HomeCategoriesCubit>().categories,
            onCategoryPressed: (categoryName) {
              context.read<HomeRecipesCubit>().fetchRecipesWithChangeCategory(
                    categoryName: categoryName,
                  );
            },
          );
        }
      },
    );
  }
}

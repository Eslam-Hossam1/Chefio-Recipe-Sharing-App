import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/categories_listview.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/skeletonizer_categories_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCategoriesAndDividerSectionBuilder extends StatelessWidget {
  const HomeCategoriesAndDividerSectionBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeFirstApiFetchFailure) {
          return SizedBox.shrink();
        } else if (state is HomefirstLoading) {
          return Column(
            children: [
              SkeletonizerCategoriesListView(),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 48,
                thickness: 8,
                color: context.formColor,
              ),
            ],
          );
        } else {
          return Column(
            children: [
              CategoriesListView(
                categories: context.read<HomeCubit>().categories,
                onCategoryPressed: (categoryName) {
                  context.read<HomeCubit>().fetchRecipesWithChangeCategory(
                        categoryName: categoryName,
                      );
                },
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 48,
                thickness: 8,
                color: context.formColor,
              ),
            ],
          );
        }
      },
    );
  }
}

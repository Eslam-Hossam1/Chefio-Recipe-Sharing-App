import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/category_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView(
      {super.key, required this.categories, required this.onCategoryPressed});
  final List<Category> categories;
  final Function(String categoryName) onCategoryPressed;
  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  late int selectedCategoryIndex;
  @override
  void initState() {
    super.initState();
    selectedCategoryIndex = 0;
  }
  // List<CategoryModel> categories = [
  //   CategoryModel.fromCategoryType(categoryType: CategoryType.generalDishes),
  //   CategoryModel.fromCategoryType(categoryType: CategoryType.mainDishes),
  //   CategoryModel.fromCategoryType(
  //       categoryType: CategoryType.dessertsAndBakery),
  // ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        // CategoryType selectedCategoryType =
        //     context.read<HomeCubit>().categoryType;
        return SizedBox(
          height: 48,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            padding: EdgeInsetsDirectional.only(
                start: width < SizeConfig.tabletBreakPoint
                    ? Constants.kMobileHorizontalPadding
                    : Constants.kTabletHorizontalpadding),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.only(
                    end: width < SizeConfig.tabletBreakPoint ? 16 : 24),
                child: CategoryButton(
                  isSelected: selectedCategoryIndex == index,
                  categoryName:
                      widget.categories[index].categoryLocalizationKey?.tr() ??
                          widget.categories[index].name,
                  // onPressed: () {
                  //   context.read<HomeCubit>().fetchRecipesWithChangeCategory(
                  //       categorytype: categories[index].categoryType);
                  // },
                  onPressed: () {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

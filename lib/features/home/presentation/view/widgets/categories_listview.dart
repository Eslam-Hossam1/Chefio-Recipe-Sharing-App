import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/features/home/data/models/category_type_enum.dart';
import 'package:chefio_app/features/home/data/models/category_model.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  CategoryType selectedCategoryType = CategoryType.all;
  List<CategoryModel> categories = [
    CategoryModel(
        categoryType: CategoryType.all,
        applocalizationKey: AppLocalizationKeys.global.all),
    CategoryModel(
        categoryType: CategoryType.food,
        applocalizationKey: AppLocalizationKeys.global.food),
    CategoryModel(
        categoryType: CategoryType.drink,
        applocalizationKey: AppLocalizationKeys.global.drink),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.only(left: 16),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 16),
            child: CategoryButton(
              //هنا هتبقي تقارن ب category type الي رجعلك من ال cubit
              isSelected:
                  selectedCategoryType == categories[index].categoryType,
              applocalizationKey: categories[index].applocalizationKey,
              onPressed: () {
                setState(() {
                  //هنا عترن الميثود من الcubit
                  //like that  context.read<CategoryCubit>().fetchCategoryItems(category);
                  selectedCategoryType = categories[index].categoryType;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

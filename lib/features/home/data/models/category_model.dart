import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/features/home/data/enums/category_type_enum.dart';

class CategoryModel {
  final String categoryName;
  final CategoryType categoryType;
  final String applocalizationKey;

  const CategoryModel._(
      {required this.categoryName,
      required this.categoryType,
      required this.applocalizationKey});
  factory CategoryModel.fromCategoryType({
    required CategoryType categoryType,
  }) {
    switch (categoryType) {
      case CategoryType.all:
        return CategoryModel._(
            categoryName: "all",
            categoryType: categoryType,
            applocalizationKey: AppLocalizationKeys.global.all,);
      case CategoryType.food:
        return CategoryModel._(
            categoryName: "food",
            categoryType: categoryType,
            applocalizationKey: AppLocalizationKeys.global.food,);

      case CategoryType.drink:
        return CategoryModel._(
            categoryName: "drink",
            categoryType: categoryType,
            applocalizationKey: AppLocalizationKeys.global.drink,);
    }
  }
}

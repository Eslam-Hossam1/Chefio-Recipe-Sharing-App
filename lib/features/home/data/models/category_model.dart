import 'package:chefio_app/features/home/data/models/category_type_enum.dart';

class CategoryModel {
  final CategoryType categoryType;
  final String applocalizationKey;

  const CategoryModel(
      {required this.categoryType, required this.applocalizationKey});
}

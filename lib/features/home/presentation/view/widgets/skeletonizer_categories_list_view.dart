import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/categories_listview.dart';
import 'package:flutter/material.dart';

class SkeletonizerCategoriesListView extends StatelessWidget {
  const SkeletonizerCategoriesListView({super.key});
    static List<Category> categories = List.generate(
    5,
    (index) => Category(name: "burger"),
  );

  @override
  Widget build(BuildContext context) {
    return CategoriesListView(categories: categories, onCategoryPressed: (_){});
  }
}

import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/categories_listview.dart';
import 'package:flutter/material.dart';

class CategoriesAndDividerSection extends StatelessWidget {
  const CategoriesAndDividerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesListView(),
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
}

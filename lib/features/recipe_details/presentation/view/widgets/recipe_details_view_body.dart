import 'dart:ui';

import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_custom_app_bar.dart';
import 'package:flutter/material.dart';

class RecipeDetailsViewBody extends StatelessWidget {
  const RecipeDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        RecipeDetailsCustomAppBar(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              title: Text('Item $index'),
            ),
            childCount: 30,
          ),
        ),
      ],
    );
  }
}

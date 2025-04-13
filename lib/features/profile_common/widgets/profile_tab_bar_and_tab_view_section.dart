import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe.dart';
import 'package:chefio_app/features/profile_common/widgets/profile_tab_bar.dart';
import 'package:chefio_app/features/profile_common/widgets/recipes_grid.dart';
import 'package:flutter/material.dart';

class ProfileTabBarAndTabViewSection extends StatelessWidget {
  const ProfileTabBarAndTabViewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileTabBar(),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: AdaptivePadding(
            child: TabBarView(
              children: [
                RecipesGrid(
                  recipes: List.generate(
                    30,
                    (index) => Recipe(
                        foodName: "$index",
                        category: Category(name: 'test category')),
                  ),
                ),
                RecipesGrid(
                  recipes: List.generate(
                    30,
                    (index) => Recipe(
                        foodName: "$index",
                        category: Category(name: 'test category')),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

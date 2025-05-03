import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe_model.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_tab_bar.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_liked_recipes_grid.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_user_recipes_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          height: 4,
        ),
        Expanded(
          child: AdaptivePadding(
            child: TabBarView(
              children: [
                ProfileChefRecipesGrid(
                  recipes: List.generate(
                    30,
                    (index) => RecipeModel(
                        foodName:
                            "$index alsdfjaskljfklajflkjasjfaksjfklajkdfja;kljfklasdj;flk",
                        isLiked: false,
                        category: Category(name: 'test category')),
                  ),
                ),
                ProfileLikedRecipesGrid(
                  recipes: List.generate(
                    30,
                    (index) => RecipeModel(
                        foodName: "$index",
                        isLiked: false,
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

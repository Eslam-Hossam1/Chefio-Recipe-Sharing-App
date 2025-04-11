import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_recipes_grid.dart';
import 'package:chefio_app/features/my_profile/presentation/view/widgets/my_profile_sliver_app_bar.dart';
import 'package:chefio_app/features/my_profile/presentation/view/widgets/profile_user_avatar_with_title.dart';
import 'package:chefio_app/features/my_profile/presentation/view/widgets/user_follower_item.dart';
import 'package:chefio_app/features/my_profile/presentation/view/widgets/user_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyProfileViewBody extends StatelessWidget {
  const MyProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            MyProfileSliverAppBar(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverAdaptivePadding(
              sliver: ProfileUserAvatarWithTitle(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: UserInfoRow(),
            ),
            SliverToBoxAdapter(
              child: Divider(
                height: 48,
                thickness: 8,
                color: context.formColor,
              ),
            ),
          ];
        },
        body: Column(
          children: [
            TabBar(
              isScrollable: false,
              dividerColor: context.primaryColor,
              tabs: [
                Tab(
                  text: 'Recipes',
                ),
                Tab(
                  text: 'liked',
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: AdaptivePadding(
                child: TabBarView(
                  children: [
                    SliverRecipesGrid(
                      recipes: List.generate(
                        30,
                        (index) => Recipe(foodName: "$index",category: Category(name: 'test category')),
                      ),
                    ),
                    SliverRecipesGrid(
                      recipes: List.generate(
                        30,
                        (index) => Recipe(foodName: "$index",category: Category(name: 'test category')),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

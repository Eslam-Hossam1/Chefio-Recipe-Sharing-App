import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_recipes_consumer.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_liked_recipes_consumer.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_tab_bar.dart';
import 'package:flutter/material.dart';

class ProfileTabBarAndTabViewSection extends StatelessWidget {
  const ProfileTabBarAndTabViewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      //  ProfileTabBar(),
        Expanded(
          child: AdaptivePadding(
            child: TabBarView(
              children: [
                ProfileChefRecipesConsumer(),
                ProfileLikedRecipesConsumer()
              ],
            ),
          ),
        ),
      ],
    );
  }
}

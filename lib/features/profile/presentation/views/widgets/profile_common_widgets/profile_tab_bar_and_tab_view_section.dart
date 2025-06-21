import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_recipes_consumer.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_liked_recipes_consumer.dart';
import 'package:flutter/material.dart';

class ProfileTabBarAndTabViewSection extends StatelessWidget {
  const ProfileTabBarAndTabViewSection({
    super.key,
    required this.profileModel,
  });
  final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AdaptivePadding(
            child: TabBarView(
              children: [
                ProfileChefRecipesConsumer(
                  chefId: profileModel.id,
                ),
                ProfileLikedRecipesConsumer(
                  chefId: profileModel.id,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

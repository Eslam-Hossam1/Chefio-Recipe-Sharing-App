import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_followers_item_consumer.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_following_item_consumer.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_info_item.dart';
import 'package:flutter/material.dart';

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({
    super.key,
    required this.profileModel,
  });
  final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProfileChefInfoItem(
          number: '${profileModel.profile.recipes.totalRecipes}',
          text: 'Recipes',
        ),
        ChefFollowingItemConsumer(
          profileModel: profileModel,
        ),
        ChefFollowersItemConsumer(
          profileModel: profileModel,
        ),
      ],
    );
  }
}

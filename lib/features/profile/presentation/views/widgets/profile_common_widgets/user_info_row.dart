import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_followers_item_consumer.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/user_follower_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProfileModel profileModel = context.read<ProfileCubit>().profileModel!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        UserFollowersItem(
          number: '${profileModel.profile.recipes.totalRecipes}',
          text: 'Recipes',
        ),
        UserFollowersItem(
          number: '${profileModel.profile.followingCount}',
          text: 'Following',
        ),
        ChefFollowersItemConsumer(profileModel: profileModel),
      ],
    );
  }
}

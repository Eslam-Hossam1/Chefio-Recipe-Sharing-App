import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/user_follower_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefFollowersItemConsumer extends StatelessWidget {
  const ChefFollowersItemConsumer({
    super.key,
    required this.profileModel,
  });

  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    final chefId = context.read<ProfileCubit>().chefId;
    return BlocConsumer<FollowChefCubit, FollowChefState>(
      listener: (context, state) {
        if ((state is FollowChefProcessing || state is FollowChefFaiure) &&
            (state as FollowChefStateWithId).chefId == chefId) {
          if (profileModel.profile.isFollowing == ApiKeys.following) {
            profileModel.profile.followersCount--;
            profileModel.profile.isFollowing == ApiKeys.notFollowing;
          } else {
            profileModel.profile.followersCount++;
            profileModel.profile.isFollowing = ApiKeys.following;
          }
        }
      },
      builder: (context, state) {
        return UserFollowersItem(
          number: '${profileModel.profile.followersCount}',
          text: 'Followers',
        );
      },
    );
  }
}

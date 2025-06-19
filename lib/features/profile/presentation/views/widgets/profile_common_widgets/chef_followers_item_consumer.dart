import 'dart:developer';

import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_followers_bottom_sheet.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefFollowersItemConsumer extends StatefulWidget {
  const ChefFollowersItemConsumer({
    super.key,
  });

  @override
  State<ChefFollowersItemConsumer> createState() =>
      _ChefFollowersItemConsumerState();
}

class _ChefFollowersItemConsumerState extends State<ChefFollowersItemConsumer> {
  late int followersCount;
  @override
  void initState() {
    super.initState();
    followersCount =
        context.read<ProfileCubit>().profileModel!.profile.followersCount;
  }

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    final profileModel = profileCubit.profileModel;
    final String profileChefId = context.read<ProfileCubit>().chefId;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (context) {
              return ChefFollowersBottomSheet(
                chefId: profileChefId,
              );
            });
      },
      child: BlocConsumer<FollowChefCubit, FollowChefState>(
        listener: (context, state) {
          if ((state is FollowChefSuccess ) &&
              state.chefId == profileChefId) {
            if (profileModel!.profile.isFollowing == ApiKeys.following) {
              profileModel.profile.followersCount--;
              followersCount--;
              profileModel.profile.isFollowing = ApiKeys.notFollowing;
            } else {
              profileModel.profile.followersCount++;
              followersCount++;
              profileModel.profile.isFollowing = ApiKeys.following;
            }
          }
        },
        builder: (context, state) {
          return ProfileChefInfoItem(
            number: '$followersCount',
            text: 'Followers',
          );
        },
      ),
    );
  }
}

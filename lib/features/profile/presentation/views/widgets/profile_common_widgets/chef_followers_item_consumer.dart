import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_followers_bottom_sheet.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefFollowersItemConsumer extends StatelessWidget {
  const ChefFollowersItemConsumer({
    super.key,
  });

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
          if ((state is FollowChefProcessing || state is FollowChefFaiure) &&
              (state as FollowChefStateWithId).chefId == profileChefId) {
            if (profileModel!.profile.isFollowing == ApiKeys.following) {
              profileModel.profile.followersCount--;
              profileModel.profile.isFollowing == ApiKeys.notFollowing;
            } else {
              profileModel.profile.followersCount++;
              profileModel.profile.isFollowing = ApiKeys.following;
            }
          }
        },
        builder: (context, state) {
          return ProfileChefInfoItem(
            number: '${profileModel!.profile.followersCount}',
            text: 'Followers',
          );
        },
      ),
    );
  }
}

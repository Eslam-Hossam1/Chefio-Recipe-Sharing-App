import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/follow_chef_in_my_profile/follow_chef_in_my_profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_followings_bottom_sheet.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefFollowingItemConsumer extends StatelessWidget {
  const ChefFollowingItemConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    final profileModel = profileCubit.profileModel;

    return GestureDetector(
      onTap: () {
        final String chefId = profileCubit.chefId;
        showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (context) {
              return ChefFollowingsBottomSheet(
                chefId: chefId,
              );
            });
      },
      child:
          BlocConsumer<FollowChefInMyProfileCubit, FollowChefInMyProfileState>(
        listener: (context, state) {
          if ((state is FollowChefInMyProfileFailure ||
              state is FollowChefInMyProfileProcessing)) {
            final ChefConnectionEntity chefFollowing =
                (state as FollowChefInMyProfileStateWithConnectionEntity)
                    .chefFollowing;
            if (chefFollowing.isFollowing) {
              profileModel!.profile.followingCount--;
              chefFollowing.isFollowing =false;
            } else {
              profileModel!.profile.followingCount++;
              chefFollowing.isFollowing = true;
            }
          }
        },
        builder: (context, state) {
          return ProfileChefInfoItem(
            number: '${profileModel!.profile.followingCount}',
            text: 'Following',
          );
        },
      ),
    );
  }
}

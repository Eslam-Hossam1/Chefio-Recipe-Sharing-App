import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/features/profile/data/models/following_state.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_followers_bottom_sheet.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefFollowersItemConsumer extends StatefulWidget {
  const ChefFollowersItemConsumer({
    super.key,
    required this.profileModel,
  });
  final ProfileModel profileModel;
  @override
  State<ChefFollowersItemConsumer> createState() =>
      _ChefFollowersItemConsumerState();
}

class _ChefFollowersItemConsumerState extends State<ChefFollowersItemConsumer> {
  late int followersCount;
  late ProfileModel profileModel;
  late String profileChefId;
  @override
  void initState() {
    super.initState();
    profileModel = widget.profileModel;
    followersCount = profileModel.profile.followersCount;
    profileChefId = profileModel.id;
  }

  @override
  Widget build(BuildContext context) {
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
          if ((state is FollowChefSuccess) && state.chefId == profileChefId) {
            if (profileModel.profile.isFollowing == FollowingState.following) {
              profileModel.profile.followersCount--;
              followersCount--;
              profileModel.profile.isFollowing = FollowingState.notFollowing;
            } else {
              profileModel.profile.followersCount++;
              followersCount++;
              profileModel.profile.isFollowing = FollowingState.following;
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

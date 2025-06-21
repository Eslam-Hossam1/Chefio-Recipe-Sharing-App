import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_followings_bottom_sheet.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefFollowingItemConsumer extends StatefulWidget {
  const ChefFollowingItemConsumer({
    super.key,
    required this.profileModel,
  });
  final ProfileModel profileModel;
  @override
  State<ChefFollowingItemConsumer> createState() =>
      _ChefFollowingItemConsumerState();
}

class _ChefFollowingItemConsumerState extends State<ChefFollowingItemConsumer> {
  late int followingCount;
  late String appUserId;
  late ProfileModel profileModel;
  late String profileChefId;

  @override
  void initState() {
    super.initState();
    profileModel = widget.profileModel;
    profileChefId = profileModel.id;
    followingCount = profileModel.profile.followingCount;
    appUserId = getIt<AuthCredentialsHelper>().userId!;
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
              return ChefFollowingsBottomSheet(
                chefId: profileChefId,
              );
            });
      },
      child: BlocConsumer<FollowChefCubit, FollowChefState>(
        listener: (context, state) {
          if ((state is FollowChefSuccess) && profileChefId == appUserId) {
            followingCount += state.myProfileFollowingChange;
          }
        },
        builder: (context, state) {
          return ProfileChefInfoItem(
            number: '$followingCount',
            text: 'Following',
          );
        },
      ),
    );
  }
}

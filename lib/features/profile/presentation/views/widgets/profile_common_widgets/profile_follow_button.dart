import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/follow_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileFollowButton extends StatefulWidget {
  const ProfileFollowButton({
    super.key,
  });
  @override
  State<ProfileFollowButton> createState() => _ProfileFollowButtonState();
}

class _ProfileFollowButtonState extends State<ProfileFollowButton> {
  late bool isFollowing;
  @override
  void initState() {
    final profile = context.read<ProfileCubit>().profileModel!.profile;
    isFollowing = profile.isFollowing == ApiKeys.following;
    super.initState();
  }

  _toggleFollow() {
    context.read<FollowChefCubit>().toggleFollowChef(
          chefId: context.read<ProfileCubit>().chefId,
        );
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FollowChefCubit, FollowChefState>(
      listener: (context, state) {
        if (state is FollowChefFaiure) {
          showCustomToast(
            context,
            message: state.errorLocalizationKey.tr(),
            seconds: 2,
          );
        }
      },
      child: FollowButton(
        isFollowing: isFollowing,
        onPressed: _toggleFollow,
      ),
    );
  }
}

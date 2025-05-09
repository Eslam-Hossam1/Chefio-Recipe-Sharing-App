import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/follow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    isFollowing = !isFollowing;
  }

  @override
  Widget build(BuildContext context) {
    return FollowButton(
        isFollowing: isFollowing,
        onPressed: () {
          setState(() {
            _toggleFollow();
          });
        });
  }
}

import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/follow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefFollowingFollowButton extends StatefulWidget {
  const ChefFollowingFollowButton({
    super.key,
    required this.chefConnectionEntity,
  });

  final ChefConnectionEntity chefConnectionEntity;
  @override
  State<ChefFollowingFollowButton> createState() =>
      _ChefFollowingFollowButtonState();
}

class _ChefFollowingFollowButtonState extends State<ChefFollowingFollowButton> {
  late bool isFollowing;
  late bool isMyProfile;
  @override
  void initState() {
    isMyProfile = getIt<AuthCredentialsHelper>().userId ==
        context.read<ProfileCubit>().chefId;
    isFollowing = widget.chefConnectionEntity.isFollowing;
    super.initState();
  }

  _toggleFollow() {
    setState(() {
      widget.chefConnectionEntity.isFollowing =
          !widget.chefConnectionEntity.isFollowing;
      isFollowing = !isFollowing;

      context.read<FollowChefCubit>().toggleFollowChef(
            chefId: widget.chefConnectionEntity.chefId,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FollowButton(
      isFollowing: isFollowing,
      onPressed: _toggleFollow,
    );
  }
}

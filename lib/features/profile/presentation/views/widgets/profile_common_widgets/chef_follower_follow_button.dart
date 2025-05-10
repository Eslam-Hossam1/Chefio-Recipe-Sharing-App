import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/follow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefFollowerFollowButton extends StatefulWidget {
  const ChefFollowerFollowButton({
    super.key,
    required this.chefConnectionEntity,
  });

  final ChefConnectionEntity chefConnectionEntity;
  @override
  State<ChefFollowerFollowButton> createState() =>
      _ChefFollowerFollowButtonState();
}

class _ChefFollowerFollowButtonState extends State<ChefFollowerFollowButton> {
  late bool isFollowing;
  @override
  void initState() {
    isFollowing = widget.chefConnectionEntity.isFollowing;
    super.initState();
  }

  _toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
      context.read<FollowChefCubit>().toggleFollowChef(
            chefId: widget.chefConnectionEntity.chefId,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FollowButton(
      isFollowing: widget.chefConnectionEntity.isFollowing,
      onPressed: _toggleFollow,
    );
  }
}

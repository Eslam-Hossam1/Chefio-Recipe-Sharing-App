import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_follower_follow_button.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_following_follow_button.dart';
import 'package:flutter/material.dart';

class ChefFollowingFollowButtonBuilder extends StatefulWidget {
  const ChefFollowingFollowButtonBuilder(
      {super.key,
      required this.chefConnection,
      required this.authCredentialsHelper});
  final ChefConnectionEntity chefConnection;
  final AuthCredentialsHelper authCredentialsHelper;
  @override
  State<ChefFollowingFollowButtonBuilder> createState() =>
      _ChefFollowingFollowButtonBuilderState();
}

class _ChefFollowingFollowButtonBuilderState
    extends State<ChefFollowingFollowButtonBuilder> {
  late bool isMe;
  @override
  void initState() {
    isMe = widget.authCredentialsHelper.userId == widget.chefConnection.chefId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isMe
        ? SizedBox.shrink()
        : ChefFollowingFollowButton(
            chefConnectionEntity: widget.chefConnection,
          );
  }
}

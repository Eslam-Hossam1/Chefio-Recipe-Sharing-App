import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/widgets/follow_button_consumer.dart';
import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:flutter/material.dart';

class ChefConnectionFollowButtonBuilder extends StatefulWidget {
  const ChefConnectionFollowButtonBuilder(
      {super.key,
      required this.chefConnection,
      required this.authCredentialsHelper});
  final ChefConnectionEntity chefConnection;
  final AuthCredentialsHelper authCredentialsHelper;
  @override
  State<ChefConnectionFollowButtonBuilder> createState() =>
      _ChefConnectionFollowButtonBuilderState();
}

class _ChefConnectionFollowButtonBuilderState
    extends State<ChefConnectionFollowButtonBuilder> {
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
        : FollowButtonConsumer(
            chefId: widget.chefConnection.chefId,
            isFollowing: widget.chefConnection.isFollowing,
            chefConnectionEntity: widget.chefConnection,
          );
  }
}


import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notification_user_with_message.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/follow_button.dart';
import 'package:flutter/material.dart';

class NotificationFollowItem extends StatelessWidget {
  const NotificationFollowItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NotificationUserWithMessage(),
        Spacer(),
        FollowButton(
          isFollowing: false,
          onPressed: () {},
        ),
      ],
    );
  }
}

import 'package:chefio_app/features/profile_common/widgets/user_follower_item.dart';
import 'package:flutter/material.dart';

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        UserFollowersItem(
          number: '32',
          text: 'Recipes',
        ),
        UserFollowersItem(
          number: '782',
          text: 'Following',
        ),
        UserFollowersItem(
          number: '1.287',
          text: 'Followers',
        ),
      ],
    );
  }
}

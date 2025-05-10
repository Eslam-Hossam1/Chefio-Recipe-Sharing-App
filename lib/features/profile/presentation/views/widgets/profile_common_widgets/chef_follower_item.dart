import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_follower_follow_button_builder.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/user_tile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChefFollowerItem extends StatelessWidget {
  const ChefFollowerItem({
    super.key,
    required this.chefConnection,
  });

  final ChefConnectionEntity chefConnection;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: UserTileItem(
            userName: chefConnection.chefUsername,
            baseSize: 50,
            userImageUrl: chefConnection.chefProfilePicture,
            intermediateSpace: 16,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        ChefFollowerFollowButtonBuilder(
          authCredentialsHelper: getIt<AuthCredentialsHelper>(),
          chefConnection: chefConnection,
        )
      ],
    );
  }
}

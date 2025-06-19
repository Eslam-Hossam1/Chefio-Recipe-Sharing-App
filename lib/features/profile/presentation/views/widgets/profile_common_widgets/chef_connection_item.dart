import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/routing/routing_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_connection_follow_button_builder.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/user_tile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChefConnectionItem extends StatelessWidget {
  const ChefConnectionItem({
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
          child: GestureDetector(
            onTap: () {
              context.push(
                RoutingHelper.getProfilePath(
                  chefId: chefConnection.chefId,
                ),
              );
            },
            child: UserTileItem(
              userName: chefConnection.chefUsername,
              baseSize: 50,
              userImageUrl: chefConnection.chefProfilePicture,
              intermediateSpace: 16,
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        ChefConnectionFollowButtonBuilder(
          authCredentialsHelper: getIt<AuthCredentialsHelper>(),
          chefConnection: chefConnection,
        )
      ],
    );
  }
}

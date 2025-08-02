import 'package:chefio_app/core/routing/routs.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/my_profile_pop_up_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MyProfileAppBar extends StatelessWidget {
  const MyProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptivePadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              context.push(RoutePaths.settings);
            },
            icon: Icon(
              FontAwesomeIcons.gear,
              color: context.mainTextColor,
            ),
          ),
          MyProfilePopUpMenuButton(),
        ],
      ),
    );
  }
}

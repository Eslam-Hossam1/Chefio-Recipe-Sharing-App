import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/my_profile_pop_up_menu_button.dart';
import 'package:flutter/material.dart';

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
          MyProfilePopUpMenuButton(),
        ],
      ),
    );
  }
}

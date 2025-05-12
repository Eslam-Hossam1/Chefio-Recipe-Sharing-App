import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/my_profile_pop_up_menu_button.dart';
import 'package:flutter/material.dart';

class MyProfileSliverAppBar extends StatelessWidget {
  const MyProfileSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        automaticallyImplyLeading: false,
        pinned: false,
        floating: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        flexibleSpace: AdaptivePadding(
          child: Row(
            children: [
              Spacer(),
             MyProfilePopUpMenuButton(),
            ],
          ),
        ));
  }
}

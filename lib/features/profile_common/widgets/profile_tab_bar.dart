
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: false,
      dividerColor: context.outlineColor,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(
          text: 'Recipes',
        ),
        Tab(
          text: 'liked',
        ),
      ],
    );
  }
}

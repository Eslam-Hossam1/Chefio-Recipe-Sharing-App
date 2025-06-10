import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({
    super.key,
    required this.tabController,
  });
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: false,
      dividerColor: context.outlineColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: Styles.textStyleSemiBold15(context),
      labelColor: context.mainTextColor,
      unselectedLabelColor: context.secondaryTextColor,
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

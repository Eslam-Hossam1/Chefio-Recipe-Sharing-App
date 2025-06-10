import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/sliver_tab_bar_delegate.dart';
import 'package:flutter/material.dart';

class SliverProfilePersistentTabBar extends StatelessWidget {
  const SliverProfilePersistentTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverTabBarDelegate(TabBar(
        controller: _tabController,
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
            text: 'Liked',
          ),
        ],
      )),
    );
  }
}

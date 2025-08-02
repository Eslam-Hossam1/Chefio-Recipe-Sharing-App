import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:easy_localization/easy_localization.dart';
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
          text: AppLocalizationKeys.profile.recipes.tr(),
        ),
        Tab(
          text: AppLocalizationKeys.profile.liked.tr(),
        ),
      ],
    );
  }
}

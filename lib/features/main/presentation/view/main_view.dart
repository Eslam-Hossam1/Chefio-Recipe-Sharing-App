import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/main/presentation/view/widgets/custom_svg_nav_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:chefio_app/features/main/data/models/bottom_nav_bar_model.dart';

class MainScaffoldView extends StatefulWidget {
  const MainScaffoldView({super.key, this.navigationShell});
  final StatefulNavigationShell? navigationShell;

  @override
  State<MainScaffoldView> createState() => _MainScaffoldViewState();
}

class _MainScaffoldViewState extends State<MainScaffoldView> {
  void _goBranch(int index) {
    widget.navigationShell!.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell!.currentIndex,
    );
  }

  final List<BottomNavBarModel> bottomNavBarModelsList = [
    BottomNavBarModel(
      image: Assets.imagesHome,
      localizationKey: AppLocalizationKeys.global.home,
    ),
    BottomNavBarModel(
      image: Assets.imagesEdit,
      localizationKey: AppLocalizationKeys.global.upload,
    ),
    BottomNavBarModel(
      image: Assets.imagesNotification,
      localizationKey: AppLocalizationKeys.global.notification,
    ),
    BottomNavBarModel(
      image: Assets.imagesProfile,
      localizationKey: AppLocalizationKeys.global.profile,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: List.generate(
          bottomNavBarModelsList.length,
          (index) => _buildBottomNavigationBarItem(
            context,
            image: bottomNavBarModelsList[index].image,
            localizationKey: bottomNavBarModelsList[index].localizationKey,
            isSelected: widget.navigationShell!.currentIndex == index,
          ),
        ),
        currentIndex: widget.navigationShell!.currentIndex,
        selectedItemColor: context.primaryColor,
        unselectedItemColor: context.secondaryTextColor,
        elevation: 0,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (index) {
          _goBranch(index);
        },
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    BuildContext context, {
    required String image,
    required String localizationKey,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: CustomSvgNavIcon(
        asset: image,
        isSelected: isSelected,
      ),
      label: localizationKey.tr(),
      backgroundColor: context.scaffoldBackgroundColor,
    );
  }
}

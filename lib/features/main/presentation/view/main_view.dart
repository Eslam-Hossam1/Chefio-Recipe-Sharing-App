import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/main/presentation/view/utils/bottom_nav_bar_item_builder.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:chefio_app/features/main/data/models/bottom_nav_bar_model.dart';

class MainScaffoldView extends StatefulWidget {
  const MainScaffoldView({super.key, this.navigationShell});
  final StatefulNavigationShell? navigationShell;

  @override
  State<MainScaffoldView> createState() => _MainScaffoldViewState();
}

class _MainScaffoldViewState extends State<MainScaffoldView> {
  late int selectedNavBarItemIndex;
  @override
  void initState() {
    selectedNavBarItemIndex = widget.navigationShell!.currentIndex;
    super.initState();
  }

  @override
  void didUpdateWidget(MainScaffoldView oldWidget) {
    super.didUpdateWidget(oldWidget);
    //to update the selectedNavBarItemIndex when nav from outside the bottom nav bar
    if (widget.navigationShell!.currentIndex != selectedNavBarItemIndex) {
      setState(() {
        if (widget.navigationShell!.currentIndex >= 1) {
          selectedNavBarItemIndex = widget.navigationShell!.currentIndex + 1;
        } else {
          selectedNavBarItemIndex = widget.navigationShell!.currentIndex;
        }
      });
    }
  }

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
        type: BottomNavigationBarType.fixed,
        backgroundColor: context.scaffoldBackgroundColor,
        items: List.generate(
          bottomNavBarModelsList.length,
          (index) => buildBottomNavigationBarItem(
            context,
            svgImagePath: bottomNavBarModelsList[index].image,
            localizationKey: bottomNavBarModelsList[index].localizationKey,
            isSelected: selectedNavBarItemIndex == index,
          ),
        ),
        currentIndex: selectedNavBarItemIndex,
        selectedItemColor: context.primaryColor,
        unselectedItemColor: context.secondaryTextColor,
        elevation: 0,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (index) {
          _onNavBarItemTap(context,
              callBackIndex: index, uploadItemIndex: 1, myProfileItemIndex: 3);
        },
      ),
    );
  }

  void _onNavBarItemTap(
    BuildContext context, {
    required int callBackIndex,
    required int uploadItemIndex,
    required int myProfileItemIndex,
  }) {
    if (callBackIndex == uploadItemIndex) {
      context.push(RoutePaths.upload);
      return;
    }
    if (callBackIndex == myProfileItemIndex) {
      context.read<ProfileCubit>().fetchChefProfileWithInitialRecipes(
            chefId: getIt<AuthCredentialsHelper>().userId!,
            limit: 30,
          );
    }

    selectedNavBarItemIndex = callBackIndex;
    int toGoBranchIndex =
        callBackIndex > uploadItemIndex ? callBackIndex - 1 : callBackIndex;
    _goBranch(toGoBranchIndex);
  }
}

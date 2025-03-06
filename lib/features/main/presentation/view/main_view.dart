import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: 'notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
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
}

import 'package:flutter/material.dart';
import 'package:ginjuice/core/constant/router.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  // getter that computes the current index from the current location using the helper method below
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index = RouterConstant.tabs
        .indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1) return 0
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.go(RouterConstant.tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        destinations: RouterConstant.tabs,
        onDestinationSelected: (index) => _onItemTapped(context, index),
      ),
    );
  }
}

class ScaffoldWithNavBarTabItem extends NavigationDestination {
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation,
      required Widget icon,
      required Widget selectedIcon,
      required String label})
      : super(icon: icon, selectedIcon: selectedIcon, label: label);

  final String initialLocation;
}

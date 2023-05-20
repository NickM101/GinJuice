import 'package:flutter/material.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final Widget child;

  const BottomNavBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  final tabs = <NavItems>[
    NavItems(
      initialLocation: AppScreen.home.pathName,
      icon: Icons.home,
      text: 'Home',
    ),
    NavItems(
      initialLocation: AppScreen.explore.pathName,
      icon: Icons.explore,
      text: 'Explore',
    ),
    NavItems(
      initialLocation: AppScreen.search.pathName,
      icon: Icons.search,
      text: 'Search',
    ),
    NavItems(
      initialLocation: AppScreen.favorite.pathName,
      icon: Icons.favorite,
      text: 'Favorite',
    ),
    NavItems(
      initialLocation: AppScreen.account.pathName,
      icon: Icons.person,
      text: 'Account',
    ),
  ];

  int _locationToTabIndex(String location) {
    final initialLocations = tabs.map((tab) => tab.initialLocation).toList();

    final index =
        initialLocations.indexWhere((initial) => initial.startsWith(location));
    return index < 0 ? 0 : index;
  }

  void _onTabChange(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: GNav(
        selectedIndex: _currentIndex,
        tabMargin: const EdgeInsets.all(10),
        tabBackgroundColor: Theme.of(context).focusColor,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        gap: 5,
        onTabChange: (value) => _onTabChange(context, value),
        tabs: tabs,
      ),
    );
  }
}

class NavItems extends GButton {
  final String initialLocation;

  const NavItems({
    super.key,
    required this.initialLocation,
    required IconData icon,
    required String text,
  }) : super(icon: icon, text: text);
}

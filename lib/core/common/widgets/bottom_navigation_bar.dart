import 'package:flutter/material.dart';
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

  static const tabs = [
    NavItems(
      initialLocation: '/home',
      icon: Icons.home,
      text: 'Home',
    ),
    NavItems(
      initialLocation: '/search',
      icon: Icons.search,
      text: 'Search',
    ),
    NavItems(
      initialLocation: '/favorite',
      icon: Icons.favorite,
      text: 'Favorite',
    ),
    NavItems(
      initialLocation: '/account',
      icon: Icons.person,
      text: 'Account',
    ),
  ];

  int _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
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
        gap: 8,
        iconSize: 32,
        onTabChange: (value) => _onTabChange(context, value),
        tabs: tabs,
      ),
    );
  }
}

class NavItems extends GButton {
  final String initialLocation;

  const NavItems(
      {super.key,
      required this.initialLocation,
      required super.icon,
      required super.text});
}

import 'package:flutter/material.dart';
import 'package:ginjuice/app/router/router.dart';
import 'package:ginjuice/app/screens/favorite_page.dart';
import 'package:ginjuice/app/screens/search_page.dart';
import 'package:go_router/go_router.dart';

import '../../app/screens/home_page.dart';

class RouterConstant {
  // private navigators
  static get _routerNavigatorKey => GlobalKey<NavigatorState>();
  static get _shellNavigatorKey => GlobalKey<NavigatorState>();

  // GoRouter instance
  static final goRouter = GoRouter(
      initialLocation: '/home',
      navigatorKey: _routerNavigatorKey,
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return ScaffoldWithBottomNavBar(child: child);
            },
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomePage(),
                ),
              ),
              GoRoute(
                path: '/search',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: SearchPage(),
                ),
              ),
              GoRoute(
                path: '/favorite',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: FavoritePage(),
                ),
              ),
            ])
      ]);

  static const tabs = [
    ScaffoldWithNavBarTabItem(
      initialLocation: '/home',
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Home',
    ),
    ScaffoldWithNavBarTabItem(
      initialLocation: '/search',
      icon: Icon(Icons.search_rounded),
      selectedIcon: Icon(Icons.search),
      label: 'Search',
    ),
    ScaffoldWithNavBarTabItem(
      initialLocation: '/favorite',
      icon: Icon(Icons.bookmark_border),
      selectedIcon: Icon(Icons.bookmark),
      label: 'Favorite',
    ),
  ];
}

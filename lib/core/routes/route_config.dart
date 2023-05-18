import 'package:flutter/material.dart';
import 'package:ginjuice/features/favorite/views/favorite_screen.dart';
import 'package:ginjuice/features/profile/views/profile_screen.dart';
import 'package:ginjuice/features/search/views/search_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/views/email_link.dart';
import '../../features/auth/views/sent_link.dart';
import '../../features/home/views/home_screen.dart';
import '../../features/intro/views/onboarding_screen.dart';
import '../../features/intro/views/splash_screen.dart';
import '../common/widgets/bottom_navigation_bar.dart';
import 'route_utils.dart';

class AppRouter {
  GoRouter get router => _goRouter;

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter _goRouter = GoRouter(
    initialLocation: AppScreen.home.pathName,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return BottomNavBar(child: child);
          },
          routes: [
            GoRoute(
              path: AppScreen.home.pathName,
              name: AppScreen.home.routeName,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HomeScreen()),
            ),
            GoRoute(
              path: AppScreen.search.pathName,
              name: AppScreen.search.routeName,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SearchScreen()),
            ),
            GoRoute(
              path: AppScreen.favorite.pathName,
              name: AppScreen.favorite.routeName,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: FavoriteScreen()),
            ),
            GoRoute(
              path: AppScreen.account.pathName,
              name: AppScreen.account.routeName,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProfileScreen()),
            ),
          ]),
      GoRoute(
        path: AppScreen.splash.pathName,
        name: AppScreen.splash.routeName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppScreen.onboarding.pathName,
        name: AppScreen.onboarding.routeName,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppScreen.login.pathName,
        name: AppScreen.login.routeName,
        builder: (context, state) => EmailMagicLink(),
      ),
      GoRoute(
        path: AppScreen.checkEmail.pathName,
        name: AppScreen.checkEmail.routeName,
        builder: (context, state) => const SentMagicLink(),
      ),
    ],
  );
}

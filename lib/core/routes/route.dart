import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/views/email_link.dart';
import '../../features/auth/views/sent_link.dart';
import '../../features/details/views/cocktail_detail.dart';
import '../../features/details/views/cocktail_steps.dart';
import '../../features/explore/views/explore_screen.dart';
import '../../features/favorite/views/favorite_screen.dart';
import '../../features/home/views/home_screen.dart';
import '../../features/intro/views/onboarding_screen.dart';
import '../../features/intro/views/splash_screen.dart';
import '../../features/profile/views/about_screen.dart';
import '../../features/profile/views/customize_avatar.dart';
import '../../features/profile/views/privacy_screen.dart';
import '../../features/profile/views/profile_screen.dart';
import '../../features/search/views/search_screen.dart';
import '../common/models/cocktail_model.dart';
import '../common/widgets/bottom_navigation_bar.dart';
import '../common/widgets/notification_widget.dart';
import 'route_utils.dart';

class AppRouter {
  GoRouter get router => _goRouter;

  AppRouter();

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter _goRouter = GoRouter(
    // debugLogDiagnostics: true,
    // refreshListenable: __,
    initialLocation: AppScreen.splash.pathName,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return BottomNavBar(child: child);
          },
          routes: <RouteBase>[
            GoRoute(
                path: AppScreen.home.pathName,
                name: AppScreen.home.routeName,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomeScreen()),
                routes: [
                  GoRoute(
                    path: AppScreen.notification.pathName,
                    name: AppScreen.notification.routeName,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const NotificationWidget(),
                  ),
                  GoRoute(
                      path: AppScreen.detail.pathName,
                      name: AppScreen.detail.routeName,
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (context, state) {
                        CocktailModel item = state.extra as CocktailModel;
                        return CocktailDetail(item: item);
                      },
                      routes: [
                        GoRoute(
                            path: AppScreen.steps.pathName,
                            name: AppScreen.steps.routeName,
                            parentNavigatorKey: _rootNavigatorKey,
                            builder: (context, state) {
                              CocktailModel item = state.extra as CocktailModel;
                              return CocktailSteps(item: item);
                            })
                      ])
                ]),
            GoRoute(
              path: AppScreen.explore.pathName,
              name: AppScreen.explore.routeName,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ExploreScreen()),
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
                routes: [
                  GoRoute(
                    path: AppScreen.updateAccount.pathName,
                    name: AppScreen.updateAccount.routeName,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: CustomizeAvatar()),
                  ),
                  GoRoute(
                    path: AppScreen.privacy.pathName,
                    name: AppScreen.privacy.routeName,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: PrivacyScreen()),
                  ),
                  GoRoute(
                    path: AppScreen.about.pathName,
                    name: AppScreen.about.routeName,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: AboutScreen()),
                  ),
                ]),
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

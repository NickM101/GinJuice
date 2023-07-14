import 'package:go_router/go_router.dart';

import '../../features/auth/views/email_link.dart';
import '../../features/intro/views/splash_screen.dart';
import '../../features/profile/views/about_screen.dart';
import '../common/widgets/notification_widget.dart';

import 'app_state.dart';
import 'route_utils.dart';

class AppRouter {
  late final AppState appState;

  GoRouter get router => _goRouter;

  AppRouter(this.appState);

  late final GoRouter _goRouter = GoRouter(
    refreshListenable: appState,
    initialLocation: AppScreen.splash.routeName,
    routes: <GoRoute>[
      GoRoute(
        path: AppScreen.splash.pathName,
        name: AppScreen.splash.routeName,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SplashScreen()),
      ),
      GoRoute(
        path: AppScreen.login.pathName,
        name: AppScreen.login.routeName,
        pageBuilder: (context, state) =>
            NoTransitionPage(child: EmailMagicLink()),
      ),
      GoRoute(
        path: AppScreen.home.pathName,
        name: AppScreen.home.routeName,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: NotificationWidget()),
      ),
      GoRoute(
        path: AppScreen.splash.pathName,
        name: AppScreen.splash.routeName,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: AboutScreen()),
      ),
    ],
    redirect: (context, state) {
      final loginLocation = state.namedLocation(AppScreen.login.routeName);
      final homeLocation = state.namedLocation(AppScreen.home.routeName);
      final splashLocation = state.namedLocation(AppScreen.splash.routeName);
      final onboardLocation =
          state.namedLocation(AppScreen.onboarding.routeName);

      final isLoggedIn = appState.loginState;
      final isInitialized = appState.initialized;
      final isOnboard = appState.onboarding;

      final isGoingToLogin = state.location == loginLocation;
      final isGoingToInit = state.location == splashLocation;
      final isGoingToOnboard = state.location == onboardLocation;

      // If not Initialized and not going to Initialized redirect to Splash
      if (!isInitialized && !isGoingToInit) {
        return splashLocation;
        // If not onboard and not going to onboard redirect to OnBoarding
      } else if (isInitialized && !isOnboard && !isGoingToOnboard) {
        return onboardLocation;
        // If not loggedin and not going to login redirect to Login
      } else if (isInitialized && isOnboard && !isLoggedIn && !isGoingToLogin) {
        return loginLocation;
        // If all the scenarios are cleared but still going to any of that screen redirect to Home
      } else if ((isLoggedIn && isGoingToLogin) ||
          (isInitialized && isGoingToInit) ||
          (isOnboard && isGoingToOnboard)) {
        return homeLocation;
      } else {
        // Else Don't do anything
        return null;
      }
    },
  );
}

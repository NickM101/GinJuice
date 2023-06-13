import 'package:ginjuice/core/common/widgets/notification_widget.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:ginjuice/core/services/app_services.dart';
import 'package:ginjuice/features/auth/views/email_link.dart';
import 'package:ginjuice/features/intro/views/splash_screen.dart';
import 'package:ginjuice/features/profile/views/about_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final AppService appService;
  GoRouter get router => _goRouter;

  AppRouter(this.appService);

  late final GoRouter _goRouter = GoRouter(
    refreshListenable: appService,
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

      final isLogedIn = appService.loginState;
      final isInitialized = appService.initialized;
      final isOnboarded = appService.onboarding;

      final isGoingToLogin = state.location == loginLocation;
      final isGoingToInit = state.location == splashLocation;
      final isGoingToOnboard = state.location == onboardLocation;

      // If not Initialized and not going to Initialized redirect to Splash
      if (!isInitialized && !isGoingToInit) {
        return splashLocation;
        // If not onboard and not going to onboard redirect to OnBoarding
      } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
        return onboardLocation;
        // If not logedin and not going to login redirect to Login
      } else if (isInitialized &&
          isOnboarded &&
          !isLogedIn &&
          !isGoingToLogin) {
        return loginLocation;
        // If all the scenarios are cleared but still going to any of that screen redirect to Home
      } else if ((isLogedIn && isGoingToLogin) ||
          (isInitialized && isGoingToInit) ||
          (isOnboarded && isGoingToOnboard)) {
        return homeLocation;
      } else {
        // Else Don't do anything
        return null;
      }
    },
  );
}

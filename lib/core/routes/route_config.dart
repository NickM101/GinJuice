import 'package:go_router/go_router.dart';

import '../../src/features/auth/views/email_link.dart';
import '../../src/features/auth/views/sent_link.dart';
import '../../src/features/home/views/home_screen.dart';
import '../../src/features/intro/views/onboarding_screen.dart';
import '../../src/features/intro/views/splash_screen.dart';
import 'route_utils.dart';

class AppRouter {
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: AppScreen.splash.pathName,
    routes: <GoRoute>[
      GoRoute(
        path: AppScreen.home.pathName,
        name: AppScreen.home.routeName,
        builder: (context, state) => const HomeScreen(),
      ),
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

enum AppScreen {
  splash,
  onboarding,
  login,
  checkEmail,
  confirmation,
  home,
  error,
}

extension AppScreenExtension on AppScreen {
  String get pathName {
    switch (this) {
      case AppScreen.splash:
        return '/splash';
      case AppScreen.onboarding:
        return '/start';
      case AppScreen.login:
        return '/login';
      case AppScreen.checkEmail:
        return '/check_email';
      case AppScreen.home:
        return '/';
      default:
        return '/';
    }
  }

  String get routeName {
    switch (this) {
      case AppScreen.splash:
        return 'splash';
      case AppScreen.onboarding:
        return 'start';
      case AppScreen.login:
        return 'login';
      case AppScreen.checkEmail:
        return 'check_email';
      case AppScreen.home:
        return 'home';
      default:
        return 'home';
    }
  }
}

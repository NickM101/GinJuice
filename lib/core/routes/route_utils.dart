enum AppScreen {
  splash,
  onboarding,
  login,
  checkEmail,
  confirmation,
  error,
  home,
  search,
  favorite,
  account,
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
        return '/home';
      case AppScreen.search:
        return '/search';
      case AppScreen.favorite:
        return '/favorite';
      case AppScreen.account:
        return '/account';
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
      case AppScreen.search:
        return 'search';
      case AppScreen.favorite:
        return 'favorite';
      case AppScreen.account:
        return 'account';
      default:
        return 'home';
    }
  }
}

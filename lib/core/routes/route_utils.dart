enum AppScreen {
  splash,
  onboarding,
  login,
  checkEmail,
  confirmation,
  error,
  home,
  explore,
  search,
  favorite,
  account,
  updateAccount,
  detail,
  steps,
  settings,
  privacy,
  about,
  notification,
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
      case AppScreen.explore:
        return '/explore';
      case AppScreen.search:
        return '/search';
      case AppScreen.favorite:
        return '/favorite';
      case AppScreen.account:
        return '/account';
      case AppScreen.updateAccount:
        return 'update_account';
      case AppScreen.detail:
        return 'detail';
      case AppScreen.steps:
        return 'steps';
      case AppScreen.settings:
        return 'settings';
      case AppScreen.privacy:
        return 'privacy';
      case AppScreen.about:
        return 'about';
      case AppScreen.notification:
        return 'notification';
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
      case AppScreen.explore:
        return 'explore';
      case AppScreen.search:
        return 'search';
      case AppScreen.favorite:
        return 'favorite';
      case AppScreen.account:
        return 'account';
      case AppScreen.updateAccount:
        return 'update_account';
      case AppScreen.detail:
        return 'detail';
      case AppScreen.steps:
        return 'steps';
      case AppScreen.settings:
        return 'settings';
      case AppScreen.privacy:
        return 'privacy';
      case AppScreen.about:
        return 'about';
      case AppScreen.notification:
        return 'notification';
      default:
        return 'home';
    }
  }
}

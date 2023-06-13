import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService with ChangeNotifier {
  late final SharedPreferences sharedPreferences;

  final StreamController<bool> _loginStateChange =
      StreamController<bool>.broadcast();

  bool _loginState = false;
  bool _initialized = false;
  bool _onboarding = false;

  AppService(this.sharedPreferences);

  bool get loginState => _loginState;
  bool get initialized => _initialized;
  bool get onboarding => _onboarding;
  Stream<bool> get loginStateChange => _loginStateChange.stream;

  set loginState(bool state) {
    sharedPreferences.setBool('LOGIN_KEY', state);
    _loginState = state;
    _loginStateChange.add(state);
    notifyListeners();
  }

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  set onboarding(bool value) {
    sharedPreferences.setBool('ONBOARD_KEY', value);
    _onboarding = value;
    notifyListeners();
  }

  Future<void> onAppStart() async {
    _onboarding = sharedPreferences.getBool('ONBOARD_KEY') ?? false;
    _loginState = sharedPreferences.getBool('LOGIN_KEY') ?? false;

    _initialized = true;
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState {
  AppState({
    required this.isInitialized,
    required this.isBoarded,
    required this.isSignedIn,
  });

  final bool isInitialized;
  final bool isBoarded;
  final bool isSignedIn;
}

typedef Reader = T Function<T>(ProviderListenable<T> provider);

class AppStateController extends StateNotifier<AppState> {
  AppStateController(this.read)
      : super(AppState(
          isInitialized: false,
          isBoarded: false,
          isSignedIn: false,
        ));

  final Reader read;

  Future<void> init() async {
    final prefs = read(sharedPreferencesProvider);
    final stateStr = prefs.getString('app_state');
    if (stateStr != null) {
      final stateJson = jsonDecode(stateStr) as Map<String, dynamic>;
      state = AppState(
        isInitialized: stateJson['isInitialized'] as bool,
        isBoarded: stateJson['isBoarded'] as bool,
        isSignedIn: stateJson['isSignedIn'] as bool,
      );
    }
  }

  Future<void> saveState() async {
    final prefs = read(sharedPreferencesProvider);
    final stateJson = {
      'isInitialized': state.isInitialized,
      'isBoarded': state.isBoarded,
      'isSignedIn': state.isSignedIn,
    };
    await prefs.setString('app_state', jsonEncode(stateJson));
  }

  void update(
      {required bool isInitialized,
      required bool isBoarded,
      required bool isSignedIn}) {
    state = AppState(
        isInitialized: isInitialized,
        isBoarded: isBoarded,
        isSignedIn: isSignedIn);
    saveState();
  }
}

final appStateControllerProvider =
    StateNotifierProvider<AppStateController, AppState>(
        (ref) => AppStateController(ref.read)..init());

final sharedPreferencesProvider = Provider<SharedPreferences>(
    (ref) => throw UnimplementedError(),
    name: 'sharedPreferences');

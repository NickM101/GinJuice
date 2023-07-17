import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/routes/app_state.dart';

final sharedPreferencesProvider = Provider<Future<SharedPreferences>>((ref) {
  return SharedPreferences.getInstance();
});
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final container = ProviderContainer();

  final sharedPreferences = await container.read(sharedPreferencesProvider);
  final appState = AppState(sharedPreferences);
  await appState.onAppStart();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider
            .overrideWithValue(sharedPreferences as Future<SharedPreferences>),
      ],
      child: GinJuiceApp(
        appState: appState,
      ),
    ),
  );

  container.dispose();
}

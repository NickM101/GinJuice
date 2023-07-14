import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'core/common/controllers/theme_provider.dart';
import 'core/common/widgets/dismiss_keyboard.dart';
import 'core/routes/app_state.dart';
import 'core/routes/route.dart';
import 'core/themes/themes.dart';

class GinJuiceApp extends ConsumerWidget {
  final sharedPreferencesProvider = Provider<Future<SharedPreferences>>((ref) {
    return SharedPreferences.getInstance();
  });

  GinJuiceApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themesProvider);

    return FutureBuilder<SharedPreferences>(
      future: ref.read(sharedPreferencesProvider),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final sharedPreferences = snapshot.data!;
          final appState =
              AppState(sharedPreferences); // Pass the required argument

          final appRouter = AppRouter(appState);

          return ProviderScope(
              overrides: [
                sharedPreferencesProvider.overrideWithValue(
                    sharedPreferences as Future<SharedPreferences>),
              ],
              child: Sizer(
                builder: (context, orientation, deviceType) {
                  return DismissKeyboard(
                    child: MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      theme: lightTheme,
                      darkTheme: darkTheme,
                      themeMode: themeMode,
                      routerConfig: appRouter.router,
                    ),
                  );
                },
              ));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

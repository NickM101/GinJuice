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
  final AppState appState;

  const GinJuiceApp({
    super.key,
    required this.appState,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themesProvider);

    return Sizer(
      builder: (context, orientation, deviceType) {
        return DismissKeyboard(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            routerConfig: AppRouter(appState).router,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themesProvider =
    StateNotifierProvider<ThemeController, ThemeMode?>((ref) {
  return ThemeController();
});

class ThemeController extends StateNotifier<ThemeMode?>
    with WidgetsBindingObserver {
  ThemeController() : super(ThemeMode.system) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void setThemeMode(ThemeMode themeMode) {
    state = themeMode;
  }

  @override
  void didChangePlatformBrightness() {
    final Brightness systemBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    final currentThemeMode = state;

    if (currentThemeMode == ThemeMode.light) {
      if (systemBrightness == Brightness.light) {
        setThemeMode(ThemeMode.light);
      } else {
        setThemeMode(ThemeMode.dark);
      }
    }
  }
}

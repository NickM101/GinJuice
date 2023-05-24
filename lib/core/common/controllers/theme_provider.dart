import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themesProvider = StateNotifierProvider<ThemesProvider, ThemeMode?>((ref) {
  return ThemesProvider();
});

class ThemesProvider extends StateNotifier<ThemeMode?> {
  ThemesProvider() : super(ThemeMode.system);

  void updateTheme() {
    final Brightness systemBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    state =
        systemBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
  }
}

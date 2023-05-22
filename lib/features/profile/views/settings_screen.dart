import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/controllers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Change Theme $themeModeState",
              style: const TextStyle(fontSize: 18),
            ),
            Consumer(
              builder: (context, ref, child) {
                return Switch(
                    value: themeModeState == ThemeMode.dark, //false or true
                    onChanged: (value) {
                      print('value --- $value');
                      ref.read(themesProvider.notifier).changeTheme(value);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}

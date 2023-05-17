import 'package:flutter/material.dart';

import 'config/themes/themes.dart';
import 'src/features/intro/views/splash_screen.dart';
import 'package:ginjuice/src/features/intro/views/onboarding_screen.dart';

class GinJuiceApp extends StatelessWidget {
  const GinJuiceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: const OnboardingScreen(),
    );
  }
}

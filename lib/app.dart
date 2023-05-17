import 'package:flutter/material.dart';
import 'package:ginjuice/src/features/auth/views/email_magic.dart';
import 'package:sizer/sizer.dart';

import 'core/themes/themes.dart';
import 'core/widgets/dismiss_keyboard.dart';
import 'src/features/intro/views/onboarding_screen.dart';

class GinJuiceApp extends StatelessWidget {
  const GinJuiceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return DismissKeyboard(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: EmailMagicLink(),
          ),
        );
      },
    );
  }
}

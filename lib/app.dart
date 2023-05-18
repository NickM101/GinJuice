import 'package:flutter/material.dart';
import 'package:ginjuice/core/routes/route_config.dart';
import 'package:ginjuice/features/favorite/views/favorite_screen.dart';
import 'package:sizer/sizer.dart';

import 'core/themes/themes.dart';
import 'core/common/widgets/dismiss_keyboard.dart';

class GinJuiceApp extends StatelessWidget {
  const GinJuiceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return DismissKeyboard(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.dark,
            routerConfig: AppRouter().router,
          ),
        );
      },
    );
  }
}

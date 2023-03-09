import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'core/constant/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        routerConfig: RouterConstant.goRouter,
        title: 'GinJuice',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.pink,
            ),
            textTheme: GoogleFonts.merriweatherTextTheme(),
            scaffoldBackgroundColor: Colors.pink[200]),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:ginjuice/pages/Home/home_page.dart';
import 'package:ginjuice/pages/favorite_page.dart';
import 'package:ginjuice/pages/search_page.dart';
import 'package:ginjuice/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GinJuice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/favorite': (context) => const FavoritePage(),
        '/search': (context) => const SearchPage(),
      },
    );
  }
}

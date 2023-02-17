import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ginjuice/components/bouncing_text.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

String getCurrentYear() {
  var date = DateTime.now().toString();

  var dateParse = DateTime.parse(date);

  var formattedDate = "${dateParse.year}";
  return formattedDate.toString();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      GoRouter.of(context).go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24142D),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('lib/assets/lottie/cocktail-mix.json'),
              const SizedBox(
                height: 10,
              ),
              const BouncingText('GinJuice'),
            ],
          ),
        ),
        Text(
          getCurrentYear(),
          style: const TextStyle(
              color: Colors.white70, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Create Your Dream Cocktail Collection!'),
        ],
      ),
    );
  }
}

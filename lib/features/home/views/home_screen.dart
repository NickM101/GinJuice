import 'package:flutter/material.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to home screen'),
            FilledButton(
                child: const Text('Navigate to details'),
                onPressed: () => context.pushNamed(AppScreen.detail.routeName))
          ],
        ),
      ),
    );
  }
}

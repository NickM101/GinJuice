import 'package:flutter/material.dart';

import '../widgets/feature_cocktail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(length: 26, vsync: this);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FeatureCocktail(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:ginjuice/features/explore/widgets/cocktail_card.dart';
import 'package:ginjuice/features/home/widgets/feature_cocktail.dart';
import 'package:ginjuice/features/home/widgets/header_widget.dart';
import 'package:go_router/go_router.dart';

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

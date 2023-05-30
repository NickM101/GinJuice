import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';
import '../widgets/cocktail_feed.dart';
import '../widgets/header_widget.dart';
import '../widgets/random_cocktail.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomSelection = ref.watch(randomSelectionProvider);
    final popular = ref.watch(popularDrinksProvider);
    final latest = ref.watch(latestDrinksProvider);
    final random = ref.watch(randomDrinksProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const HeaderWidget(),
            SizedBox(
              height: 2.h,
            ),
            RandomCocktail(
              cocktail: random,
            ),
            SizedBox(
              height: 2.h,
            ),
            CocktailFeed(
              title: 'Popular',
              cocktails: popular,
            ),
            CocktailFeed(
              title: 'Latest',
              cocktails: latest,
            ),
            CocktailFeed(
              title: 'Random Picks',
              cocktails: randomSelection,
            ),
          ],
        ),
      ),
    );
  }
}

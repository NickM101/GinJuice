import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/controllers/cocktail_provider.dart';
import '../controllers/home_controller.dart';
import '../widgets/cocktail_feed.dart';
import '../widgets/header_widget.dart';
import '../widgets/random_cocktail.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomSelection = ref.watch(adventureCocktailProvider);
    final popular = ref.watch(popularCocktailProvider);
    final latest = ref.watch(latestCocktailProvider);
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
              title: "Signature Sips",
              cocktails: popular,
            ),
            CocktailFeed(
              title: "Fresh Pour",
              cocktails: latest,
            ),
            CocktailFeed(
              title: "Cocktail Concoctions",
              cocktails: randomSelection,
            ),
          ],
        ),
      ),
    );
  }
}

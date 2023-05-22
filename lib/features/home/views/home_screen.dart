import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/home_controller.dart';
import '../widgets/feature_cocktail.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(length: 26, vsync: this);

  @override
  Widget build(BuildContext context) {
    final popularDrinksAsyncValue = ref.watch(popularDrinksProvider);

    return popularDrinksAsyncValue.when(
      data: (popularDrinks) {
        // Display popular drinks
        return ListView.builder(
          itemCount: popularDrinks.length,
          itemBuilder: (context, index) {
            final drink = popularDrinks[index];
            // Build UI for each drink item
            return ListTile(
              title: Text(drink.strDrink),
              // ...
            );
          },
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}

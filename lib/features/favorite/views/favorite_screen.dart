import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/core/common/models/cocktail_model.dart';
import 'package:ginjuice/features/favorite/controllers/favorite_controller.dart';
import 'package:sizer/sizer.dart';

import '../widgets/favorite_cocktail.dart';

// ignore: must_be_immutable
class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CocktailModel> favorites = ref.watch(favoriteProvider).favoriteItems;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Favorites',
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: GridView.builder(
              itemCount: favorites.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 30.w / 38.h,
              ),
              itemBuilder: (context, index) {
                final favorite = favorites[index];

                return FavoriteCocktail(
                  imageUrl: favorite.strDrinkThumb,
                  heartCount: 2,
                  name: favorite.strDrink,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

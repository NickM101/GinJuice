import 'package:flutter/material.dart';
import 'package:ginjuice/features/favorite/widgets/favorite_cocktail.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoriteCocktail(
      imageUrl:
          'https://www.thecocktaildb.com/images/media/drink/x894cs1504388670.jpg',
      heartCount: 20,
      name: 'Classic Dry Martini',
    );
  }
}

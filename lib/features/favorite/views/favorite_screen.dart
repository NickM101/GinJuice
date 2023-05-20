import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/favorite_cocktail.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      childAspectRatio: 40.w / 30.h,
      crossAxisCount: 2,
      children: List.generate(
        10,
        (index) => const FavoriteCocktail(
          imageUrl:
              'https://www.thecocktaildb.com/images/media/drink/x894cs1504388670.jpg',
          heartCount: 20,
          name: 'Classic Dry Martini',
        ),
      ),
    );
  }
}

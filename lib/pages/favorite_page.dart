import 'package:flutter/material.dart';
import 'package:ginjuice/models/cocktail.dart';
import 'package:ginjuice/pages/Home/widgets/cocktail_gallery.dart';

import '../data/cocktail_data.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(CocktailData.drinks.length, (index) {
          final item = CocktailData.drinks[index];
          final cocktail = Cocktail.fromJson(item);
          return CocktailGallery(cocktail: cocktail);
        }),
      ),
    );
  }
}

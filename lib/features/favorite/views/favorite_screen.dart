import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/favorite_cocktail.dart';

// ignore: must_be_immutable
class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  List<Map<String, dynamic>> favorite = [
    {
      "idDrink": "11007",
      "strDrink": "Margarita",
      "strCategory": "Ordinary Drink",
      "strAlcoholic": "Alcoholic",
      "strGlass": "Cocktail glass",
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg"
    },
    {
      "idDrink": "11118",
      "strDrink": "Blue Margarita",
      "strCategory": "Ordinary Drink",
      "strAlcoholic": "Alcoholic",
      "strGlass": "Cocktail glass",
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/bry4qh1582751040.jpg"
    },
    {
      "idDrink": "17216",
      "strDrink": "Tommy's Margarita",
      "strCategory": "Ordinary Drink",
      "strAlcoholic": "Alcoholic",
      "strGlass": "Old-Fashioned glass",
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/loezxn1504373874.jpg"
    },
    {
      "idDrink": "16158",
      "strDrink": "Whitecap Margarita",
      "strCategory": "Other / Unknown",
      "strAlcoholic": "Alcoholic",
      "strGlass": "Margarita/Coupette glass",
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/srpxxp1441209622.jpg"
    },
    {
      "idDrink": "12322",
      "strDrink": "Strawberry Margarita",
      "strCategory": "Ordinary Drink",
      "strAlcoholic": "Alcoholic",
      "strGlass": "Cocktail glass",
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/tqyrpw1439905311.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
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
              itemCount: favorite.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 30.w / 38.h,
              ),
              itemBuilder: (context, index) {
                return FavoriteCocktail(
                  imageUrl: favorite[index]['strDrinkThumb'],
                  heartCount: 2,
                  name: favorite[index]['strDrink'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchedCocktails extends StatelessWidget {
  List<Map<String, dynamic>> cocktails = [
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
    {
      "idDrink": "178332",
      "strDrink": "Smashed Watermelon Margarita",
      "strCategory": "Cocktail",
      "strAlcoholic": "Alcoholic",
      "strGlass": "Margarita glass",
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/trvwpu1454515129.jpg"
    }
  ];

  SearchedCocktails({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cocktails.length,
      itemBuilder: (context, index) {
        final cocktailData = cocktails[index];
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Row(
              children: [
                Card(
                  child: Image.network(
                    cocktailData['strDrinkThumb'],
                    height: 20.h,
                    width: 35.w,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Text('Failed to load image');
                    },
                  ),
                ),
                SizedBox(
                  width: 1.h,
                ),
                SizedBox(
                  width: 40.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name:',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Text(cocktailData['strDrink']),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Type:',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Text(cocktailData['strAlcoholic']),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Glass:',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Text(cocktailData['strGlass']),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_right),
                )
              ],
            ));
      },
    );
  }
}

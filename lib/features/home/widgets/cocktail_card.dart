import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/widgets/custom_elevated_button.dart';

class CocktailCard extends StatefulWidget {
  const CocktailCard({super.key});

  @override
  State<CocktailCard> createState() => _CocktailCardState();
}

class _CocktailCardState extends State<CocktailCard> {
  int pageSelectedIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PageView.builder(
        controller: PageController(
          viewportFraction: 0.8,
        ),
        padEnds: false,
        onPageChanged: (index) {
          setState(() {
            pageSelectedIndex = index;
          });
        },
        itemCount: cocktails.length,
        itemBuilder: (context, index) {
          var scale = pageSelectedIndex == index ? 1.0 : 0.8;
          final cocktail = cocktails[index];
          return TweenAnimationBuilder(
            duration: const Duration(milliseconds: 500),
            tween: Tween(begin: scale, end: scale),
            curve: Curves.easeInOut,
            builder: (context, value, child) => Transform.scale(
              scale: value,
              child: child,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(cocktail['strDrinkThumb']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Container(),
                  ),
                ),
                Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 25.h,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              cocktail['strDrink'],
                              maxLines: 2,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            AutoSizeText(
                              cocktail['strGlass'],
                              maxLines: 2,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 10,
                              children: [
                                Chip(label: Text(cocktail['strCategory'])),
                                Chip(label: Text(cocktail['strAlcoholic'])),
                                const Chip(label: Text('Ingredients (5)')),
                              ],
                            ),
                            CustomElevatedButton(
                                text: 'View Details ',
                                onPressed: () {
                                  context.pushNamed(AppScreen.detail.routeName);
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


//context.pushNamed(AppScreen.detail.routeName);
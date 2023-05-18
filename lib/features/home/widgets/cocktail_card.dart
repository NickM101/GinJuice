import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
    return PageView.builder(
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
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(cocktail['strDrinkThumb']),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText(
                      cocktail['strDrink'],
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.apply(color: Colors.white),
                    ),
                    AutoSizeText(
                      cocktail['strGlass'],
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.apply(color: Colors.white),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              minimumSize: const Size(30, 40)),
                          child: const Icon(Icons.arrow_forward),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

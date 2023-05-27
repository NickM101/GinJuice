import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/data/ingredients_data.dart';

// ignore: must_be_immutable
class CocktailDetail extends StatelessWidget {
  CocktailDetail({super.key});

  List<Map<String, dynamic>> favorite = [
    {
      "idDrink": "17204",
      "strDrink": "Long Island Iced Tea",
      "strDrinkAlternate": null,
      "strTags": "IBA,ContemporaryClassic",
      "strVideo": null,
      "strCategory": "Ordinary Drink",
      "strIBA": "Contemporary Classics",
      "strAlcoholic": "Alcoholic",
      "strGlass": "Highball glass",
      "strInstructions":
          "Mix all contents in a highball glass and sitr gently. Add dash of Coca-Cola for the coloring and garnish with lemon or lime twist.",
      "strInstructionsES": null,
      "strInstructionsDE":
          "Den gesamten Inhalt in einem Highball-Glas mischen und vorsichtig umrühren. Für die Farbgebung einen Schuss Coca-Cola hinzufügen und mit Zitronen- oder Limettenspirale garnieren.",
      "strInstructionsFR": null,
      "strInstructionsIT":
          "Mescolare tutto il contenuto in un bicchiere highball e mescolare delicatamente.\r\nAggiungere un pizzico di Coca-Cola per la colorazione e guarnire con una scorza di limone o lime.",
      "strInstructionsZH-HANS": null,
      "strInstructionsZH-HANT": null,
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/wx7hsg1504370510.jpg",
      "strIngredient1": "Vodka",
      "strIngredient2": "Tequila",
      "strIngredient3": "Light rum",
      "strIngredient4": "Gin",
      "strIngredient5": "Coca-Cola",
      "strIngredient6": "Lemon peel",
      "strIngredient7": null,
      "strIngredient8": null,
      "strIngredient9": null,
      "strIngredient10": null,
      "strIngredient11": null,
      "strIngredient12": null,
      "strIngredient13": null,
      "strIngredient14": null,
      "strIngredient15": null,
      "strMeasure1": "1/2 oz ",
      "strMeasure2": "1/2 oz ",
      "strMeasure3": "1/2 oz ",
      "strMeasure4": "1/2 oz ",
      "strMeasure5": "1 dash ",
      "strMeasure6": "Twist of ",
      "strMeasure7": null,
      "strMeasure8": null,
      "strMeasure9": null,
      "strMeasure10": null,
      "strMeasure11": null,
      "strMeasure12": null,
      "strMeasure13": null,
      "strMeasure14": null,
      "strMeasure15": null,
      "strImageSource": null,
      "strImageAttribution": null,
      "strCreativeCommonsConfirmed": "No",
      "dateModified": "2017-09-02 17:41:50"
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
  ];

  void closeButton() {
    print('Close  Button pressed');
  }

  String getCategory(String ingredientName) {
    for (final category in categorizedIngredients) {
      if (category.ingredients.contains(ingredientName)) {
        return category.name;
      }
    }

    return 'Other';
  }

  @override
  Widget build(BuildContext context) {
    final item = favorite[0];
    final Map<String, List<String>> categorizedIngredients = {};

    for (int i = 1; i <= 15; i++) {
      final ingredientName = item['strIngredient$i'];
      final measure = item['strMeasure$i'];

      if (ingredientName != null && measure != null) {
        final ingredientCategory = getCategory(ingredientName);

        if (categorizedIngredients.containsKey(ingredientCategory)) {
          categorizedIngredients[ingredientCategory]!
              .add('$measure $ingredientName');
        } else {
          categorizedIngredients[ingredientCategory] = [
            '$measure $ingredientName'
          ];
        }
      }
    }

    final List<Widget> categoryWidgets = [];

    categorizedIngredients.forEach((category, ingredients) {
      final categoryWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                ingredients.map((ingredient) => Text(ingredient)).toList(),
          ),
        ],
      );
      categoryWidgets.add(categoryWidget);
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: closeButton,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.black26), // Set the background color here
          ),
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
            fill: 0.5,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item['strDrinkThumb']),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 80.w,
                        child: Center(
                          child: AutoSizeText(
                            item['strDrink'],
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.apply(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item['strCategory'],
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.apply(color: Colors.white),
                          ),
                          Text(
                            ' ▫️ ${item['strAlcoholic']}',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.apply(color: Colors.white),
                          ),
                          Text(
                            ' ▫️ ${item['strGlass']}',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.apply(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Ingredients'),
          ),
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              mainAxisSpacing: 1.0, // Adjust the spacing between the rows
              crossAxisSpacing: 8.0, // Adjust the spacing between the columns
              childAspectRatio: 1.5,
              children: categoryWidgets,
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(fixedSize: Size(60.w, 8.h)),
                    child: const Text('Start Mixing'),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

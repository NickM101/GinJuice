import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CocktailDetail extends StatelessWidget {
  CocktailDetail({super.key});

  List<Map<String, dynamic>> favorite = [
    {
      "idDrink": "11118",
      "strDrink": "Blue Margarita",
      "strDrinkAlternate": null,
      "strTags": null,
      "strVideo": null,
      "strCategory": "Ordinary Drink",
      "strIBA": null,
      "strAlcoholic": "Alcoholic",
      "strGlass": "Cocktail glass",
      "strInstructions":
          "Rub rim of cocktail glass with lime juice. Dip rim in coarse salt. Shake tequila, blue curacao, and lime juice with ice, strain into the salt-rimmed glass, and serve.",
      "strInstructionsES": null,
      "strInstructionsDE":
          "Den Rand des Cocktailglases mit Limettensaft einreiben. Den Rand in grobes Salz tauchen. Tequila, blauen Curacao und Limettensaft mit Eis schütteln, in das mit Salz umhüllte Glas abseihen und servieren.",
      "strInstructionsFR": null,
      "strInstructionsIT":
          "Strofinare il bordo del bicchiere da cocktail con succo di lime. Immergere il bordo nel sale grosso. Shakerare tequila, blue curacao e succo di lime con ghiaccio, filtrare nel bicchiere bordato di sale e servire.",
      "strInstructionsZH-HANS": null,
      "strInstructionsZH-HANT": null,
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/bry4qh1582751040.jpg",
      "strIngredient1": "Tequila",
      "strIngredient2": "Blue Curacao",
      "strIngredient3": "Lime juice",
      "strIngredient4": "Salt",
      "strIngredient5": null,
      "strIngredient6": null,
      "strIngredient7": null,
      "strIngredient8": null,
      "strIngredient9": null,
      "strIngredient10": null,
      "strIngredient11": null,
      "strIngredient12": null,
      "strIngredient13": null,
      "strIngredient14": null,
      "strIngredient15": null,
      "strMeasure1": "1 1/2 oz ",
      "strMeasure2": "1 oz ",
      "strMeasure3": "1 oz ",
      "strMeasure4": "Coarse ",
      "strMeasure5": null,
      "strMeasure6": null,
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
      "strCreativeCommonsConfirmed": "Yes",
      "dateModified": "2015-08-18 14:51:53"
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

  @override
  Widget build(BuildContext context) {
    final item = favorite[0];

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
          )
        ],
      ),
    );
  }
}

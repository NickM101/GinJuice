import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CocktailSteps extends StatelessWidget {
  CocktailSteps({super.key});

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

  @override
  Widget build(BuildContext context) {
    String instructions = favorite[0]['strInstructions'] ?? '';
    List<String> instructionList = instructions.split('. ');

// Remove any empty strings from the list
    instructionList.removeWhere((instruction) => instruction.isEmpty);

// Display the instructions
    for (int i = 0; i < instructionList.length; i++) {
      print('Step ${i + 1}: ${instructionList[i]}');
    }
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 1.h,
          ),
          Card(
            elevation: 5,
            child: SizedBox(
              height: 20.h,
              width: 90.w,
              child: Center(
                child: Text(
                  'Instructions'.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            itemCount: instructionList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(instructionList[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

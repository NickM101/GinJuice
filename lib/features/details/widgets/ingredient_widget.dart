import 'package:flutter/material.dart';

class DrinkIngredientsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> drinks;

  const DrinkIngredientsWidget({Key? key, required this.drinks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Categorize the ingredients
    final Map<String, List<String>> categorizedIngredients = {};

    for (final drink in drinks) {
      for (int i = 1; i <= 15; i++) {
        final ingredientKey = 'strIngredient$i';
        final measureKey = 'strMeasure$i';

        final ingredient = drink[ingredientKey] as String?;
        final measure = drink[measureKey] as String?;

        if (ingredient != null && ingredient.isNotEmpty) {
          final category = getCategory(ingredient);

          if (!categorizedIngredients.containsKey(category)) {
            categorizedIngredients[category] = [];
          }

          final oz = drink['strMeasure1'] ?? '';
          final ingredientWithMeasure = measure != null && measure.isNotEmpty
              ? '$oz $measure $ingredient'
              : '$oz $ingredient';

          categorizedIngredients[category]!.add(ingredientWithMeasure);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Drink Ingredients'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: categorizedIngredients.length,
          itemBuilder: (context, index) {
            final category = categorizedIngredients.keys.toList()[index];
            final ingredients = categorizedIngredients[category]!;

            return CategoryCard(
              category: category,
              ingredients: ingredients,
            );
          },
        ),
      ),
    );
  }

  String getCategory(String ingredient) {
    // Define your category logic here
    if (ingredient.contains('vodka') ||
        ingredient.contains('gin') ||
        ingredient.contains('rum') ||
        ingredient.contains('tequila') ||
        ingredient.contains('whiskey') ||
        ingredient.contains('brandy')) {
      return 'Base Spirits';
    } else if (ingredient.contains('triple sec') ||
        ingredient.contains('amaretto') ||
        ingredient.contains('cointreau') ||
        ingredient.contains('baileys') ||
        ingredient.contains('kahlua') ||
        ingredient.contains('frangelico') ||
        ingredient.contains('grand marnier')) {
      return 'Liqueurs';
    } else if (ingredient.contains('vermouth')) {
      return 'Vermouths';
    } else if (ingredient.contains('bitters')) {
      return 'Bitters';
    } else if (ingredient.contains('juice')) {
      return 'Fruit Juices';
    } else if (ingredient.contains('soda') ||
        ingredient.contains('tonic') ||
        ingredient.contains('cola') ||
        ingredient.contains('ginger ale') ||
        ingredient.contains('ginger beer')) {
      return 'Mixers/Sodas';
    } else if (ingredient.contains('syrup') ||
        ingredient.contains('grenadine') ||
        ingredient.contains('agave') ||
        ingredient.contains('honey') ||
        ingredient.contains('maple syrup')) {
      return 'Syrups/Sweeteners';
    } else if (ingredient.contains('milk') ||
        ingredient.contains('cream') ||
        ingredient.contains('coconut milk') ||
        ingredient.contains('condensed milk') ||
        ingredient.contains('evaporated milk')) {
      return 'Dairy/Cream';
    } else if (ingredient.contains('garnish')) {
      return 'Garnishes';
    } else {
      return 'Other';
    }
  }
}

class CategoryCard extends StatelessWidget {
  final String category;
  final List<String> ingredients;

  const CategoryCard({
    Key? key,
    required this.category,
    required this.ingredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  ingredients.map((ingredient) => Text(ingredient)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

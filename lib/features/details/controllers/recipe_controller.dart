import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/models/cocktail_model.dart';
import '../../../core/data/ingredients_data.dart';

final recipeProvider = Provider((ref) => RecipeController());

class RecipeController {
  final List<String> ingredients = [];
  final List<String> measurements = [];
  final Map<String, List<String>> categorizedIngredients = {};

  List<Widget> processIngredients(CocktailModel item) {
    ingredients.clear();
    measurements.clear();
    categorizedIngredients.clear();

    final List<Widget> categoryWidgets = [];

    for (int i = 1; i <= 15; i++) {
      final ingredientName = item.getIngredient(i);
      final measure = item.getMeasure(i);

      if (ingredientName != null && measure != null) {
        ingredients.add(ingredientName);
        measurements.add(measure);
      }
    }

    for (int i = 0; i < ingredients.length; i++) {
      final ingredientName = ingredients[i];
      final measure = measurements[i];

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

    categorizedIngredients.forEach((category, ingredients) {
      final categoryWidget = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    ingredients.map((ingredient) => Text(ingredient)).toList(),
              ),
            ],
          ),
        ),
      );
      if (category == 'Other') {
        categoryWidgets.add(categoryWidget);
      } else {
        categoryWidgets.insert(0, categoryWidget);
      }
    });

    return categoryWidgets;
  }

  String getCategory(String? ingredientName) {
    if (ingredientName != null) {
      final lowercaseIngredient = ingredientName.toLowerCase();
      for (final category in defaultCategorizedIngredients) {
        final lowercaseIngredients =
            category.ingredients.map((i) => i.toLowerCase());
        if (lowercaseIngredients.contains(lowercaseIngredient)) {
          return category.name;
        }
      }
    }

    return 'Other';
  }
}

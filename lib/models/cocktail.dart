class Cocktail {
  String? idDrink;
  String? strDrink;
  String? strCategory;
  String? strAlcoholic;
  String? strGlass;
  String? strInstructions;
  String? strDrinkThumb;
  List<String>? ingredients;

  Cocktail({
    this.idDrink,
    this.strDrink,
    this.strCategory,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strDrinkThumb,
    this.ingredients,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    var ingredients = <String>[];
    for (var i = 1; i <= 15; i++) {
      var ingredientKey = 'strIngredient$i';
      if (json.containsKey(ingredientKey) && json[ingredientKey] != null) {
        ingredients.add(json[ingredientKey]);
      } else {
        break;
      }
    }

    return Cocktail(
      idDrink: json['idDrink'],
      strDrink: json['strDrink'],
      strCategory: json['strCategory'],
      strAlcoholic: json['strAlcoholic'],
      strGlass: json['strGlass'],
      strInstructions: json['strInstructions'],
      strDrinkThumb: json['strDrinkThumb'],
      ingredients: ingredients.isEmpty ? null : ingredients,
    );
  }

  List<String> getIngredients() {
    return ingredients ?? [];
  }
}

class Cocktail {
  String? idDrink;
  String? strDrink;
  String? strCategory;
  String? strAlcoholic;
  String? strGlass;
  String? strInstructions;
  String? strDrinkThumb;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;

  Cocktail({
    this.idDrink,
    this.strDrink,
    this.strCategory,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strDrinkThumb,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
  });

  factory Cocktail.fromMap(Map<String, dynamic> map) {
    return Cocktail(
      idDrink: map['idDrink'],
      strDrink: map['strDrink'],
      strCategory: map['strCategory'],
      strAlcoholic: map['strAlcoholic'],
      strGlass: map['strGlass'],
      strInstructions: map['strInstructions'],
      strDrinkThumb: map['strDrinkThumb'],
      strIngredient1: map['strIngredient1'],
      strIngredient2: map['strIngredient2'],
      strIngredient3: map['strIngredient3'],
    );
  }
}

class IngredientCategory {
  final String name;
  final List<String> ingredients;

  IngredientCategory({
    required this.name,
    required this.ingredients,
  });
}

final List<IngredientCategory> categorizedIngredients = [
  IngredientCategory(
    name: "Base Spirits",
    ingredients: [
      "Vodka",
      "Gin",
      "Rum",
      "Tequila",
      "Whiskey",
      "Brandy",
    ],
  ),
  IngredientCategory(
    name: "Liqueurs",
    ingredients: [
      "Triple sec",
      "Amaretto",
      "Cointreau",
      "Baileys Irish Cream",
      "Kahlua",
      "Frangelico",
      "Grand Marnier",
    ],
  ),
  IngredientCategory(
    name: "Vermouths",
    ingredients: [
      "Dry vermouth",
      "Sweet vermouth",
    ],
  ),
  IngredientCategory(
    name: "Bitters",
    ingredients: [
      "Angostura bitters",
      "Peychaud's bitters",
    ],
  ),
  IngredientCategory(
    name: "Fruit Juices",
    ingredients: [
      "Orange juice",
      "Pineapple juice",
      "Cranberry juice",
      "Lemon juice",
      "Lime juice",
      "Grapefruit juice",
    ],
  ),
  IngredientCategory(
    name: "Mixers/Sodas",
    ingredients: [
      "Soda water",
      "Tonic water",
      "Cola",
      "Ginger ale",
      "Ginger beer",
    ],
  ),
  IngredientCategory(
    name: "Syrups/Sweeteners",
    ingredients: [
      "Simple syrup",
      "Grenadine",
      "Agave syrup",
      "Honey",
      "Maple syrup",
    ],
  ),
  IngredientCategory(
    name: "Dairy/Cream",
    ingredients: [
      "Milk",
      "Cream",
      "Coconut milk",
      "Condensed milk",
      "Evaporated milk",
    ],
  ),
  IngredientCategory(
    name: "Garnishes",
    ingredients: [
      "Lime wedge",
      "Lemon twist",
      "Orange slice",
      "Cherry",
      "Mint sprig",
    ],
  ),
];
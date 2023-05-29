class IngredientCategory {
  final String name;
  final List<String> ingredients;

  IngredientCategory({
    required this.name,
    required this.ingredients,
  });
}

final List<IngredientCategory> defaultCategorizedIngredients = [
  IngredientCategory(
    name: "Base Spirits",
    ingredients: [
      "Vodka",
      "Gin",
      "Rum",
      "Tequila",
      "Whiskey",
      "Brandy",
      "Spiced rum",
      "Light rum",
      "Dark rum",
      "Añejo rum",
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
      "Grain alcohol",
      "Midori melon liqueur"
          "Jack daniel"
    ],
  ),
  IngredientCategory(
    name: "Vermouths",
    ingredients: [
      "Dry Vermouth",
      "Sweet Vermouth",
      "Rosso Vermouth",
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
    name: "Spice/Seasoning",
    ingredients: [
      "Cloves",
      "Nutmeg",
      "Cinnamon",
      "Ginger",
    ],
  ),
  IngredientCategory(
    name: "Fruit Juices",
    ingredients: [
      "Apple juice",
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
      "Coca-Cola",
      "Ginger ale",
      "Ginger beer",
      "Lemonade",
      "Apple cider"
          "Coffee"
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
      "Sugar syrup",
      "Brown sugar",
      "Elderflower cordial"
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
      "Lemon peel",
      "Orange slice",
      "Cherry",
      "Mint sprig",
    ],
  ),
];

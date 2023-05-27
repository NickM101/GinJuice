import 'package:freezed_annotation/freezed_annotation.dart';

part 'cocktail_model.freezed.dart';
part 'cocktail_model.g.dart';

@freezed
class CocktailModel with _$CocktailModel {
  const factory CocktailModel({
    required String idDrink,
    required String strDrink,
    String? strDrinkAlternate,
    String? strTags,
    String? strVideo,
    required String strCategory,
    String? strIBA,
    String? strAlcoholic,
    String? strGlass,
    String? strInstructions,
    String? strInstructionsES,
    String? strInstructionsDE,
    String? strInstructionsFR,
    String? strInstructionsIT,
    String? strInstructionsZH_HANS,
    String? strInstructionsZH_HANT,
    required String strDrinkThumb,
    String? strIngredient1,
    String? strIngredient2,
    String? strIngredient3,
    String? strIngredient4,
    String? strIngredient5,
    String? strIngredient6,
    String? strIngredient7,
    String? strIngredient8,
    String? strIngredient9,
    String? strIngredient10,
    String? strIngredient11,
    String? strIngredient12,
    String? strIngredient13,
    String? strIngredient14,
    String? strIngredient15,
    String? strMeasure1,
    String? strMeasure2,
    String? strMeasure3,
    String? strMeasure4,
    String? strMeasure5,
    String? strMeasure6,
    String? strMeasure7,
    String? strMeasure8,
    String? strMeasure9,
    String? strMeasure10,
    String? strMeasure11,
    String? strMeasure12,
    String? strMeasure13,
    String? strMeasure14,
    String? strMeasure15,
    String? strImageSource,
    String? strImageAttribution,
    String? strCreativeCommonsConfirmed,
    String? dateModified,
  }) = _CocktailModel;

  factory CocktailModel.fromJson(Map<String, dynamic> json) =>
      _$CocktailModelFromJson(json);

  String? getIngredient(int index) {
    return [
      strIngredient1,
      strIngredient2,
      strIngredient3,
      strIngredient4,
      strIngredient5,
      strIngredient6,
      strIngredient7,
      strIngredient8,
      strIngredient9,
      strIngredient10,
      strIngredient11,
      strIngredient12,
      strIngredient13,
      strIngredient14,
      strIngredient15,
    ][index - 1];
  }

  String? getMeasure(int index) {
    return [
      strMeasure1,
      strMeasure2,
      strMeasure3,
      strMeasure4,
      strMeasure5,
      strMeasure6,
      strMeasure7,
      strMeasure8,
      strMeasure9,
      strMeasure10,
      strMeasure11,
      strMeasure12,
      strMeasure13,
      strMeasure14,
      strMeasure15,
    ][index - 1];
  }
}

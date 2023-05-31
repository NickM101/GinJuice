import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cocktail_model.dart';

final popularCocktailProvider =
    FutureProvider<List<CocktailModel>>((ref) async {
  final jsonString = await rootBundle.loadString('assets/json/popular.json');
  final jsonList = jsonDecode(jsonString) as List<dynamic>;

  return jsonList.map((json) => CocktailModel.fromJson(json)).toList();
});

final latestCocktailProvider = FutureProvider<List<CocktailModel>>((ref) async {
  final jsonString = await rootBundle.loadString('assets/json/latest.json');
  final jsonList = jsonDecode(jsonString) as List<dynamic>;

  return jsonList.map((json) => CocktailModel.fromJson(json)).toList();
});

final adventureCocktailProvider =
    FutureProvider<List<CocktailModel>>((ref) async {
  final jsonString = await rootBundle.loadString('assets/json/adventure.json');
  final jsonList = jsonDecode(jsonString) as List<dynamic>;

  return jsonList.map((json) => CocktailModel.fromJson(json)).toList();
});

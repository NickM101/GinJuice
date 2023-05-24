import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/home_repository.dart';
import '../../../core/common/models/cocktail_model.dart';

final popularDrinksProvider =
    FutureProvider.autoDispose<List<CocktailModel>>((ref) async {
  final repository = ref.read(homeRepositoryProvider);
  return repository.fetchPopularDrinks();
});

final randomSelectionProvider =
    FutureProvider.autoDispose<List<CocktailModel>>((ref) async {
  final repository = ref.read(homeRepositoryProvider);
  return repository.fetchRandomSelection();
});

final randomDrinksProvider =
    FutureProvider.autoDispose<List<CocktailModel>>((ref) async {
  final repository = ref.read(homeRepositoryProvider);
  return repository.fetchRandom();
});

final latestDrinksProvider =
    FutureProvider.autoDispose<List<CocktailModel>>((ref) async {
  final repository = ref.read(homeRepositoryProvider);
  return repository.fetchLatest();
});

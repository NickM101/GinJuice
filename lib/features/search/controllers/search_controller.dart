import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/models/cocktail_model.dart';
import '../repository/search_repository.dart';

final searchResultProvider = StateProvider<List<CocktailModel>>((ref) => []);
final searchHistoryProvider = StateProvider<List<CocktailModel>>((ref) => []);
final selectedSearchProvider = StateProvider<List<CocktailModel>>((ref) => []);

final searchCocktailProvider = FutureProvider.autoDispose
    .family<List<CocktailModel>, String>((ref, letter) async {
  final repository = ref.read(searchRepositoryProvider);

  // TODO isEmpty dont run search

  return repository.getSearchResult(letter, ref);
});

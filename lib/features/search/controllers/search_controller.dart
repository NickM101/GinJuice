import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/models/cocktail_model.dart';
import '../repository/search_repository.dart';

// final searchResultProvider = StateProvider<List<CocktailModel>>((ref) => []);
final searchHistoryProvider = StateProvider<List<CocktailModel>>((ref) => []);
final selectedSearchProvider = StateProvider<List<CocktailModel>>((ref) => []);

final searchCocktailProvider =
    FutureProvider.autoDispose.family<void, String>((ref, letter) async {
  final repository = ref.read(searchRepositoryProvider);

  // TODO isEmpty dont run search

  try {
    final result = await repository.getSearchResult(letter, ref);
    return result;
  } catch (e) {
    throw Exception('Failed to get search results: $e');
  }
});

class SearchController extends StateNotifier<AsyncValue<List<CocktailModel>>> {
  SearchController() : super(const AsyncValue.loading());

  void updateSearchResult(List<CocktailModel> result) {
    state = AsyncValue.data(result);
  }

  void setError(Exception error) {
    state = AsyncValue.error(error, StackTrace.current);
  }
}

final searchResultProvider =
    StateNotifierProvider<SearchController, AsyncValue>(
  (ref) => SearchController(),
);

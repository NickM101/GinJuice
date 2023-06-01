import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/models/cocktail_model.dart';
import '../repository/search_repository.dart';

// final searchResultProvider = StateProvider<List<CocktailModel>>((ref) => []);
// final searchHistoryProvider = StateProvider<List<CocktailModel>>((ref) => []);
final selectedSearchProvider = StateProvider<List<CocktailModel>>((ref) => []);

// final searchCocktailProvider =
//     FutureProvider.autoDispose.family<void, String>((ref, letter) async {
//   final repository = ref.read(searchRepositoryProvider);

//   // TODO isEmpty dont run search

//   try {
//     final result = await repository.getSearchResult(letter, ref);
//     return result;
//   } catch (e) {
//     throw Exception('Failed to get search results: $e');
//   }
// });

// class SearchController extends StateNotifier<AsyncValue<List<CocktailModel>>> {
//   SearchController() : super(const AsyncValue.loading());

//   void updateSearchResult(List<CocktailModel> result) {
//     state = AsyncValue.data(result);
//   }

//   void setError(Exception error) {
//     state = AsyncValue.error(error, StackTrace.current);
//   }
// }

// final searchResultProvider =
//     StateNotifierProvider<SearchController, AsyncValue>(
//   (ref) => SearchController(),
// );

final searchControllerProvider =
    StateNotifierProvider<SearchController, AsyncValue<List<CocktailModel>>>(
        (ref) {
  return SearchController(searchRef: ref);
});

class SearchController extends StateNotifier<AsyncValue<List<CocktailModel>>> {
  final StateNotifierProviderRef<SearchController,
      AsyncValue<List<CocktailModel>>> searchRef;
  SearchController({required this.searchRef})
      : super(const AsyncValue.loading());

  List<CocktailModel> items = [];

  Future<void> performSearch(String query) async {
    try {
      final repository = searchRef.read(searchRepositoryProvider);
      state = const AsyncValue.loading();
      final results = await repository.getSearchResult(query);
      state = AsyncValue.data(results);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  void clearSearch() {
    state = const AsyncValue.data([]);
  }

  void saveSelectedItem(CocktailModel item) {
    print('Selected item: $item');
    items.add(item);
  }

  List<CocktailModel> showSelectedItems() => items;
}

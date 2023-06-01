import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/models/cocktail_model.dart';
import '../repository/search_repository.dart';

final selectedSearchProvider = StateProvider<List<CocktailModel>>((ref) => []);

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

  final List<CocktailModel> items = [];
  late String search_query = '';

  void updateText(String text) => search_query = text;

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
    search_query = '';
    state = const AsyncValue.data([]);
  }

  void saveSelectedItem(CocktailModel item) {
    print('Selected item: $item');
    items.add(item);
  }

  void clearSelectedItems() => items.clear();

  List<CocktailModel> showSelectedItems() => items;
}

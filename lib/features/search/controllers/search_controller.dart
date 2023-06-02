import 'package:flutter/material.dart';
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
      : super(const AsyncValue.data([]));

  final List<CocktailModel> items = [];
  late String searchQuery = '';

  void updateText(String text) => searchQuery = text;

  Future<void> performSearch(String query, BuildContext context) async {
    try {
      final repository = searchRef.read(searchRepositoryProvider);
      state = const AsyncValue.loading();
      final results = await repository.getSearchResult(query, context);
      state = AsyncValue.data(results);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  void clearSearch() {
    searchQuery = '';
    state = const AsyncValue.data([]);
  }

  void saveSelectedItem(CocktailModel item) {
    items.add(item);
  }

  void clearSelectedItems() => items.clear();

  List<CocktailModel> showSelectedItems() => items;
}

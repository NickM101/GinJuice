import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/features/search/views/search_empty_screen.dart';

import '../controllers/search_controller.dart';
import '../widgets/searched_cocktails.dart';

// class SearchScreen extends ConsumerStatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   ConsumerState<SearchScreen> createState() => SearchScreenState();
// }

// class SearchScreenState extends ConsumerState<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final searchResult = ref.watch(searchResultProvider);

class SearchScreen extends ConsumerWidget {
  SearchScreen({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(searchControllerProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                ref
                    .read(searchControllerProvider.notifier)
                    .performSearch(value);
              },
              decoration: InputDecoration(
                label: const Text('Find Your Perfect Cocktail'),
                filled: true,
                hintText: 'margarita...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    // TODO: Store textfield value for history search feed
                    _searchController.clear();
                    ref.read(searchControllerProvider.notifier).clearSearch();
                  },
                  icon: const Icon(Icons.clear),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
          Expanded(
            child: searchController.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
              data: (results) {
                if (results.isEmpty) {
                  return const SearchEmptyScreen(history: []);
                } else {
                  return SearchedCocktails(value: searchController);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

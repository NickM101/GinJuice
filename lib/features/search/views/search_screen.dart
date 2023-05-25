import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/widgets/cocktail_list_widget.dart';
import '../../../core/data/cocktail_data.dart';
import '../controllers/search_controller.dart';
import '../widgets/cocktail_glasses.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchResult = ref.watch(searchResultProvider);
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
                ref.read(searchCocktailProvider(value));
              },
              decoration: InputDecoration(
                filled: true,
                hintText: 'margarita...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    // TODO: Store textfield value for history search feed
                    _searchController.clear();
                    ref
                        .read(searchResultProvider.notifier)
                        .update((state) => []);
                  },
                  icon: const Icon(Icons.clear),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
          // Expanded(child: SearchedCocktails())
          Expanded(
              child: searchResult.isNotEmpty
                  ? CocktailList(items: searchResult)
                  : searchSuggestion())
        ],
      ),
    );
  }
}

Widget searchSuggestion() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CocktailGlasses(
          title: 'Cocktail Glasses',
          list: cocktailGlasses,
        ),
        CocktailGlasses(
          title: 'Cocktail Glasses',
          list: cocktailGlasses,
        ),
        CocktailGlasses(
          title: 'Cocktail Glasses',
          list: cocktailGlasses,
        ),
      ],
    ),
  );
}

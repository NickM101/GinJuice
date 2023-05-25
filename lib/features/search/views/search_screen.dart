import 'package:flutter/material.dart';

import '../widgets/cocktail_glasses.dart';
import '../../../core/data/cocktail_data.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                print('value --- $value');
              },
              decoration: InputDecoration(
                filled: true,
                hintText: 'margarita...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    _searchController.clear();
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

          CocktailGlasses(
            title: 'Cocktail Glasses',
            list: cocktailGlasses,
          ),
        ],
      ),
    );
  }
}

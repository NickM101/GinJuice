import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/cocktail_glasses.dart';

import '../widgets/searched_cocktails.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
          // Expanded(child: SearchedCocktails())
          Text(
            'Cocktail Categories',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Expanded(flex: 1, child: CocktailGlasses()),
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Cocktail Glasses',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Expanded(flex: 1, child: CocktailGlasses()),
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Cocktail Ingredients',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Expanded(flex: 1, child: CocktailGlasses()),
        ],
      ),
    );
  }
}

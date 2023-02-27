import 'package:flutter/material.dart';

class SearchAutocomplete extends StatelessWidget {
  const SearchAutocomplete({Key? key}) : super(key: key);

  // List<String> _cocktails = ['Allegheny', 'Algonquin', 'Alexander'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Search Cocktail',
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: const Icon(Icons.clear_all),
          filled: true,
          fillColor: Colors.white54,
        ),
        keyboardAppearance: Brightness.dark,
        keyboardType: TextInputType.text,
      ),
    );
  }
}

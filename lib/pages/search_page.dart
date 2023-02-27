import 'package:flutter/material.dart';
import 'package:ginjuice/widgets/search_autocomplete.dart';

//
import '../data/cocktail_data.dart';
import '../models/cocktail.dart';
import 'Home/widgets/cocktail_gallery.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        const SearchAutocomplete(),
        Flexible(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(CocktailData.drinks.length, (index) {
              final item = CocktailData.drinks[index];
              final cocktail = Cocktail.fromJson(item);
              return CocktailGallery(cocktail: cocktail);
            }),
          ),
        ),
      ],
    );
  }
}

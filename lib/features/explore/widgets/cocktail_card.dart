import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/alphabet_controller.dart';

class CocktailCard extends ConsumerStatefulWidget {
  const CocktailCard({super.key});

  @override
  CocktailCardState createState() => CocktailCardState();
}

class CocktailCardState extends ConsumerState<CocktailCard> {
  int pageSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final letter = ref.watch(selectedLetterProvider);
    final searchResult = ref.watch(searchCategoryProvider(letter));
    return searchResult.when(
      data: (data) => Container(),
      error: (err, stack) => Text('Error: $err'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}



//context.pushNamed(AppScreen.detail.routeName);
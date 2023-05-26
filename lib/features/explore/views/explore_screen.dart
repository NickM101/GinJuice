import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/widgets/header_widget.dart';
import '../../search/widgets/searched_cocktails.dart';
import '../controllers/alphabet_controller.dart';
import '../widgets/alphabet_row.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final letter = ref.watch(selectedLetterProvider);

    final searchResult = ref.watch(searchCategoryProvider(letter));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const HeaderWidget(),
          Expanded(
            flex: 12,
            child: RotatedBox(
              quarterTurns: 3,
              child: Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: AlphabetRow(),
                  ),
                  Expanded(
                    flex: 11,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: SearchedCocktails(value: searchResult),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

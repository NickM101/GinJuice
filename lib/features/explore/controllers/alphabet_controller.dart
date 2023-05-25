import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/core/common/models/cocktail_model.dart';
import 'package:ginjuice/features/explore/repositories/explore_repo.dart';

final selectedLetterProvider = StateProvider<String>((ref) => 'A');

final searchCategoryProvider = FutureProvider.autoDispose
    .family<List<CocktailModel>, String>((ref, letter) async {
  final repository = ref.read(exploreRepositoryProvider);

  return repository.getSelectedCategory(letter);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/explore_repo.dart';
import '../../../core/common/models/cocktail_model.dart';

final selectedLetterProvider = StateProvider<String>((ref) => 'A');

final searchCategoryProvider = FutureProvider.autoDispose
    .family<List<CocktailModel>, String>((ref, letter) async {
  final repository = ref.read(exploreRepositoryProvider);
  ref.keepAlive();
  return repository.getSelectedCategory(letter);
});

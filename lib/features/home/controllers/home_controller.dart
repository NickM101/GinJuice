import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/home_repository.dart';
import '../../../core/common/models/cocktail_model.dart';

final randomDrinksProvider = FutureProvider<List<CocktailModel>>((ref) async {
  final repository = ref.read(homeRepositoryProvider);
  return repository.fetchRandom();
});

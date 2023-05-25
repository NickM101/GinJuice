import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/models/cocktail_model.dart';
import '../repository/search_repository.dart';

final textEditingControllerProvider =
    StateProvider((ref) => TextEditingController());

final searchCategoryProvider = FutureProvider.autoDispose
    .family<List<CocktailModel>, String>((ref, letter) async {
  final repository = ref.read(searchRepositoryProvider);

  return repository.getSelectedCategory(letter);
});

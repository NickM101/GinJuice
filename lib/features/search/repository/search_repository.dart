import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/features/search/controllers/search_controller.dart';

import '../../../core/common/models/cocktail_model.dart';
import '../../../core/common/providers/dio_provider.dart';

final searchRepositoryProvider = Provider<SearchRepository>(
  (ref) => SearchRepository(
    dio: ref.read(dioProvider),
  ),
);

class SearchRepository {
  final Dio dio;

  SearchRepository({
    required this.dio,
  });

  Future<List<CocktailModel>> getSearchResult(String letter,
      AutoDisposeFutureProviderRef<List<CocktailModel>> ref) async {
    try {
      final response = await dio.get('/search.php?s=$letter');
      final data = await response.data['drinks'] as List<dynamic>;
      final result = data.map((json) => CocktailModel.fromJson(json)).toList();
      return ref.read(searchResultProvider.notifier).update((state) => result);
    } catch (e) {
      throw Exception('Failed to get name drinks: $e');
    }
  }
}

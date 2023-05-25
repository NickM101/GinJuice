import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Future<List<CocktailModel>> getSelectedCategory(String letter) async {
    try {
      final response = await dio.get('/search.php?s=$letter');
      final data = await response.data['drinks'] as List<dynamic>;
      return data.map((json) => CocktailModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to get name drinks: $e');
    }
  }
}

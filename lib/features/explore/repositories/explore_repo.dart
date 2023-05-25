import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/core/common/models/cocktail_model.dart';
import 'package:ginjuice/features/explore/controllers/alphabet_controller.dart';

import '../../../core/common/providers/dio_provider.dart';

final exploreRepositoryProvider = Provider<ExploreRepository>(
  (ref) => ExploreRepository(
    dio: ref.read(dioProvider),
  ),
);

class ExploreRepository {
  final Dio dio;

  ExploreRepository({
    required this.dio,
  });

  Future<List<CocktailModel>> getSelectedCategory(String letter) async {
    try {
      final response = await dio.get('/search.php?f=$letter');
      final data = await response.data['drinks'] as List<dynamic>;
      return data.map((json) => CocktailModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to get letter drinks: $e');
    }
  }
}

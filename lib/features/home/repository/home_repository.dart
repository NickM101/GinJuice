import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/models/cocktail_model.dart';
import '../../../core/common/providers/dio_provider.dart';

final homeRepositoryProvider = Provider<HomeRepository>(
    (ref) => HomeRepository(dio: ref.read(dioProvider)));

class HomeRepository {
  final Dio dio;
  HomeRepository({
    required this.dio,
  });

  Future<List<CocktailModel>> fetchRandom() async {
    try {
      final response = await dio.get('/random.php');
      final data = response.data['drinks'] as List<dynamic>;
      return data.map((json) => CocktailModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch random drinks: $e');
    }
  }
}

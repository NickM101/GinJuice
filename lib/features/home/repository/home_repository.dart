import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/core/common/providers/dio_provider.dart';

import '../../../core/common/models/cocktail_model.dart';

final homeRepositoryProvider = Provider<HomeRepository>(
    (ref) => HomeRepository(dio: ref.read(dioProvider)));

class HomeRepository {
  final Dio dio;
  HomeRepository({
    required this.dio,
  });

  Future<List<CocktailModel>> fetchPopularDrinks() async {
    try {
      final response = await dio.get('/popular.php');
      final data = response.data['drinks'] as List<dynamic>;
      return data.map((json) => CocktailModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch popular drinks: $e');
    }
  }

  Future<List<CocktailModel>> fetchRandomSelection() async {
    try {
      final response = await dio.get('/randomselection.php');
      final data = response.data['drinks'] as List<dynamic>;
      return data.map((json) => CocktailModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch random selection drinks: $e');
    }
  }

  Future<List<CocktailModel>> fetchRandom() async {
    try {
      final response = await dio.get('/random.php');
      final data = response.data['drinks'] as List<dynamic>;
      return data.map((json) => CocktailModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch random drinks: $e');
    }
  }

  Future<List<CocktailModel>> fetchLatest() async {
    try {
      final response = await dio.get('/latest.php');
      final data = response.data['drinks'] as List<dynamic>;
      return data.map((json) => CocktailModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch latest drinks: $e');
    }
  }
}

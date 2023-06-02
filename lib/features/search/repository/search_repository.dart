import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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

  Future<List<CocktailModel>> getSearchResult(
      String query, BuildContext context) async {
    try {
      final response = await dio.get('/search.php?s=$query');
      final data = await response.data['drinks'] as List<dynamic>;

      if (data.isEmpty) {
        if (context.mounted) {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.info(
              message: 'No search record found.',
            ),
          );
        }
        return [];
      }

      final result = data.map((json) => CocktailModel.fromJson(json)).toList();
      return result;
      // return ref.read(searchResultProvider.notifier).updateSearchResult(result);
    } catch (e) {
      throw Exception('Failed to get name drinks: $e');
    }
  }
}

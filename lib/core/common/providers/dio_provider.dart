import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider<Dio>((ref) {
  const apiKey = String.fromEnvironment('API_KEY');

  print('api_key ----- $apiKey');

  final options = BaseOptions(
    baseUrl: 'https://thecocktaildb.com/api/json/v1/1',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  );

  Dio dio = Dio(options);
  dio.interceptors.add(PrettyDioLogger());
  return dio;
});

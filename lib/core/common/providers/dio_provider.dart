import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
    baseUrl: 'https://www.thecocktaildb.com/api/json/v1/1',
  );

  Dio dio = Dio(options);
  // dio.interceptors.add(PrettyDioLogger());
  return dio;
});

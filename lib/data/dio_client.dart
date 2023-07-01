import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mvvm_core_project/data/curl_logger_interceptor.dart';
import 'package:mvvm_core_project/data/logger_interceptor.dart';

enum HttpMethod { get, post, put, patch, delete }

class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions()
        ..baseUrl = "https://reqres.in/api"
        ..connectTimeout = const Duration(milliseconds: 5000)
        ..receiveTimeout = const Duration(milliseconds: 5000)
        ..sendTimeout = const Duration(milliseconds: 5000),
    )
      // ..interceptors.add(AuthInterceptor())
      ..interceptors.add(LoggerInterceptor())
      ..interceptors.add(CurlLoggerDioInterceptor());
  }

  Future<Response?> request({
    required String path,
    HttpMethod? method,
    dynamic data,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      switch (method) {
        case HttpMethod.get:
          Response response = await dio.get(path, queryParameters: queryParams);
          return response;
        case HttpMethod.post:
          Response response = await dio.post(path, data: data);
          return response;
        default:
          return null;
      }
    } catch (e) {
      log("$e");
      rethrow;
    }
  }
}

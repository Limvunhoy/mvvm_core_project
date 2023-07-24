import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_core_project/data/auth_interceptor.dart';
import 'package:mvvm_core_project/data/curl_logger_interceptor.dart';
import 'package:mvvm_core_project/data/logger_interceptor.dart';

enum HttpMethod { get, post, put, patch, delete }

class BaseApi {
  Dio? _dio;

  BaseApi() {
    _dio = Dio(
      BaseOptions()
        ..baseUrl = "http://reqres.in/api"
        ..connectTimeout = const Duration(milliseconds: 500)
        ..receiveTimeout = const Duration(milliseconds: 500)
        ..sendTimeout = const Duration(milliseconds: 500),
    )
      ..interceptors.add(AuthInterceptor())
      ..interceptors.add(LoggerInterceptor())
      ..interceptors.add(CurlLoggerDioInterceptor());
  }

  Future<Response?> request({
    required String endpoint,
    HttpMethod? method = HttpMethod.get,
    dynamic data,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      switch (method) {
        case HttpMethod.get:
          Response response = await _dio!.get(endpoint, queryParameters: queryParams);
          return response;
        case HttpMethod.post:
          Response response = await _dio!.post(endpoint, data: data);
          return response;
        default:
      }
    } catch (e) {
      rethrow;
    }
  }
}

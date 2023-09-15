import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_core_project/data/curl_logger_interceptor.dart';
import 'package:mvvm_core_project/data/logger_interceptor.dart';
import 'package:mvvm_core_project/utilities/api_response.dart';
import 'package:mvvm_core_project/utilities/custom_exception.dart';

enum HttpMethod { get, post, put, patch, delete }

class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions()
        // ..baseUrl = "https://reqres.in/api"
        ..baseUrl = "https://api.themoviedb.org/3"
        ..connectTimeout = const Duration(milliseconds: 5000)
        ..receiveTimeout = const Duration(milliseconds: 5000)
        ..sendTimeout = const Duration(milliseconds: 5000),
    )
      // ..interceptors.add(AuthInterceptor())
      ..interceptors.add(LoggerInterceptor())
      ..interceptors.add(CurlLoggerDioInterceptor());
  }

  Future<Response> request({
    required String path,
    HttpMethod? method,
    dynamic data,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    // try {
    //   switch (method) {
    //     case HttpMethod.get:
    //       Response response = await dio.get(path, queryParameters: queryParams);
    //       // return response;
    //       return ApiResponse.success(statusCode: response.statusCode, data: response.data);
    //     case HttpMethod.post:
    //       Response response = await dio.post(path, queryParameters: queryParams, data: data);
    //       return ApiResponse.success(statusCode: response.statusCode, data: response.data);
    //     default:
    //       return ApiResponse.error(statusCode: 400, errorMessage: "Unsupported HTTP method");
    //   }
    // } catch (e) {
    //   return ApiResponse.error(statusCode: 400, errorMessage: "Network request failed: $e");
    // }
    try {
      switch (method) {
        case HttpMethod.get:
          Response response = await dio.get(path, queryParameters: queryParams);
          return response;
        case HttpMethod.post:
          Response response = await dio.post(path, queryParameters: queryParams, data: data);
          return response;
        default:
          throw CustomDioException(errorMessage: "Unsupported HTTP method: '$method'");
      }
    } catch (e) {
      debugPrint("DioClient Exception: $e");
      rethrow;
    }
  }
}

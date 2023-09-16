import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_core_project/data/dio_client.dart';
import 'package:mvvm_core_project/data/exception.dart';
import 'package:mvvm_core_project/data/model/api_error.dart';
import 'package:mvvm_core_project/data/model/base_model.dart';
import 'package:mvvm_core_project/data/model/decodable.dart';
import 'package:mvvm_core_project/utilities/api_error.dart';
import 'package:mvvm_core_project/utilities/api_response.dart';
import 'package:mvvm_core_project/utilities/network_result.dart';

class BaseService {
  final DioClient _baseApi;

  BaseService({required DioClient api}) : _baseApi = api;

  // Response within callback as parameters callback functions
  Future<void> execute<T extends IBaseModel>(
    String endpoint, {
    HttpMethod? method = HttpMethod.get,
    dynamic data,
    Map<String, dynamic>? queryParams,
    required T model,
    required Function(T, Response) onSuccess,
    required Function(APIError) onFailure,
  }) async {
    try {
      var response = await _baseApi.request(
        path: endpoint,
        method: method,
        data: data,
        queryParams: queryParams,
      );
      if (response == null) return;
      if (response.statusCode == 200) {
        var data = Decodable.shared.decode<T>(response: response, model: model);
        // return data;
        return onSuccess(data, response);
      } else {
        var apiError =
            APIError(statusCode: response.statusCode, json: response.data);
        return onFailure(apiError);
      }
    } on DioException catch (e) {
      return onFailure(_handleError(e));
    }
  }

  // Response as sealed class
  Future<Result<T, APIError>> request<T extends IBaseModel>(
      String endpoint, {
        HttpMethod? method = HttpMethod.get,
        dynamic data,
        Map<String, dynamic>? queryParams,
        required T model,
      }) async {
    try {
      var response = await _baseApi.request(
        path: endpoint,
        method: method,
        data: data,
        queryParams: queryParams,
      );
      if (response.statusCode == 200) {
        var data = Decodable.shared.decode<T>(response: response, model: model);
        return Success(data);
      } else {
        var apiError =
        APIError(statusCode: response.statusCode, json: response.data);
        return Failure(apiError);
      }
    } on DioException catch (e) {
      return Failure(_handleError(e));
    }
  }

  APIError _handleError(DioException dioException) {
    return APIError(
        statusCode: dioException.response?.statusCode,
        json: dioException.response?.data);
  }
}

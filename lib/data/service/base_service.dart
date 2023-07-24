import 'package:flutter/foundation.dart';
import 'package:mvvm_core_project/data/dio_client.dart';
import 'package:mvvm_core_project/data/exception.dart';
import 'package:mvvm_core_project/data/model/base_model.dart';
import 'package:mvvm_core_project/data/model/decodable.dart';

class BaseService {
  final DioClient _baseApi;

  BaseService({required DioClient api}) : _baseApi = api;

  Future<T> execute<T extends IBaseModel>(
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
      if (response != null && response.statusCode == 200) {
        var data = Decodable.shared.decode<T>(response: response, model: model);
        return data;
      } else {
        throw ServerException();
      }
    } catch (e) {
      // TODO: Handle Exception Error
      debugPrint("Something weng wrong: $e");
      rethrow;
    }
  }
}

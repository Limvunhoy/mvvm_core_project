// abstract class Decodable<T> {
//   T decode(dynamic data);
// }

// class TypeDecodable<T> implements Decodable<TypeDecodable<T>> {
//   T value;
//   TypeDecodable({required this.value});

//   @override
//   TypeDecodable<T> decode(data) {
//     value = data;
//     return this;
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_core_project/data/model/base_model.dart';

class Decodable {
  static var shared = Decodable();

  T decode<T extends IBaseModel>({
    required Response<dynamic> response,
    required T model,
  }) {
    try {
      if (response.data is List) {
        var list = response.data as List;
        var dataList = List<T>.from(list.map((e) => model.fromJson(e)).toList()) as T;
        return dataList;
      } else {
        var data = model.fromJson(response.data) as T;
        return data;
      }
    } on TypeError {
      rethrow;
    } catch (e, stacktrace) {
      debugPrint("Error Decode Model: $T, Exception: $e, Stacktrace: $stacktrace");
      rethrow;
    }
  }
}

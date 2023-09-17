import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("*** REQUEST LOG ***");
    _printKeyValue("URL", options.uri);
    _printKeyValue("METHOD", options.method);
    if (options.headers.isNotEmpty) {
      _printKeyValue("REQUEST HEADERS", _logJson(options.headers));
    }

    if (options.method != "GET") {
      _printKeyValue("REQUEST BODY", _logJson(options.data));
    }
    debugPrint("*** END LOG ***");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("*** RESPONSE LOG ***");
    final responseData = response.data;
    final responseJson = _logJson(responseData);
    final responseTime = response.realUri.toString();
    _printKeyValue("RESPONSE TIME", responseTime);
    _printKeyValue("RESPONSE", responseJson);
    debugPrint("*** END LOG ***");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("*** ERROR LOG ***");
    _printKeyValue("URL", err.requestOptions.uri);
    _printKeyValue("STATUS CODE", err.response?.statusCode.toString());
    if (err.requestOptions.method != "GET") {
      _printKeyValue("REQUEST BODY", _logJson(err.requestOptions.headers));
    }
    if (err.response != null) {
      _printKeyValue("ERROR RESPONSE", err.response!.data);
    }
    _printKeyValue("DIO EXCEPTION:", err.toString());
    debugPrint("*** END LOG ***");
    super.onError(err, handler);
  }

  String _logJson(dynamic data) {
    try {
      if (data is Map<String, dynamic>) {
        String jsonData = json.encode(data);
        return const JsonEncoder.withIndent('  ').convert(json.decode(jsonData));
      } else {
        return data.toString();
      }
    } catch (e) {
      return "Unable to parse response body. $e";
    }
  }

  void _printKeyValue(String key, dynamic value) {
    debugPrint("$key: $value");
  }
}

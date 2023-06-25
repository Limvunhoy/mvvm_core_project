import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_core_project/constants/endpoints.dart';
import 'package:mvvm_core_project/utilities/app_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    List<String> excludedEndpoints = [EndPoint.login];

    if (!excludedEndpoints.contains(options.uri.path)) {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      AppPreferences appPreferences = AppPreferences(sharedPreferences: sharedPreferences);
      String accessToken = appPreferences.getString("access_token") ?? "";
      if (accessToken.isNotEmpty) {
        options.headers["Authorization"] = "Bearer $accessToken";
      } else {
        debugPrint("$this: Access token was empty");
      }
    }

    super.onRequest(options, handler);
    return handler.next(options);
  }
}

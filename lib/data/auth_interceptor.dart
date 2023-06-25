import 'package:dio/dio.dart';
import 'package:mvvm_core_project/constants/endpoints.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    List<String> excludedEndpoints = [EndPoint.login];
    // TODO: Get access token from sharedpreferences
    String accessToken = "";

    if (!excludedEndpoints.contains(options.uri.path)) {
      // TODO: Request with Bearer Token
      options.headers["Authorization"] = "Bearer $accessToken";
    }

    super.onRequest(options, handler);
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}

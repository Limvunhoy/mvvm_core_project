import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_core_project/constants/endpoints.dart';
import 'package:mvvm_core_project/data/dio_client.dart';
import 'package:mvvm_core_project/data/model/api_error.dart';
import 'package:mvvm_core_project/data/model/auth/create_token_response.dart';
import 'package:mvvm_core_project/data/model/auth/validate_login_body_request.dart';
import 'package:mvvm_core_project/data/service/base_service.dart';
import 'package:mvvm_core_project/utilities/api_error.dart';
import 'package:mvvm_core_project/utilities/network_result.dart';

class LoginService extends BaseService {
  LoginService({required DioClient api}) : super(api: api);

  final String apiKey = "712077dc796ceef687c9063293854405";

  // MARK: - Request to API Generate Token
  // Response as sealed class in Dart3
  Future<Result<CreateTokenResponse, APIError>> requestGenerateToken() async {
    final res = await request(EndPoint.login,
        queryParams: {
          "api_key": apiKey,
        },
        model: CreateTokenResponse());
    return res;
  }

  // MARK: - Request to API Generate Token
  // Response as parameter callback functions
  Future<void> generateToken(
      {required Function(CreateTokenResponse) onSuccess,
      required Function(APIError)? onFailure}) async {
    await execute(EndPoint.login,
        queryParams: {
          "api_key": apiKey,
        },
        model: CreateTokenResponse(),
        onSuccess: (CreateTokenResponse tokenResponse, _) {
      onSuccess(tokenResponse);
    }, onFailure: (error) {
      if (onFailure != null) {
        onFailure(error);
      }
    });
  }
}

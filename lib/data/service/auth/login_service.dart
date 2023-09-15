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

  Future<CreateTokenResponse> createToken() async {
    // try {
    //   var res = await execute(EndPoint.login,
    //       queryParams: {
    //         "api_key": "712077dc796ceef687c9063293854405",
    //       },
    //       model: CreateTokenResponse());
    //
    //   return res;
    // } catch (e) {
    //   debugPrint("Failed to create token: $e");
    //   rethrow;
    // }
    return CreateTokenResponse();
  }

  Future<void> generateToken(
      {required Function(CreateTokenResponse) onSuccess,
      required Function(APIError)? onFailure}) async {
    // var res = await execute(EndPoint.login,
    //     queryParams: {
    //       "api_key": "712077dc796ceef687c90632938544058",
    //     },
    //     model: CreateTokenResponse());
    //
    // if (res.data != null && res.isSuccess) {
    //   return res.data!;
    // } else {
    //   return null;
    // }

    await execute(EndPoint.login,
        queryParams: {
          "api_key": "712077dc796ceef687c90632938544058",
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

  Future<Result<CreateTokenResponse, APIError>> requestGenerateToken() async {
    final res = await request(EndPoint.login,
        queryParams: {
          "api_key": "712077dc796ceef687c90632938544058",
        },
        model: CreateTokenResponse());
    return res;
  }

  Future<bool> validateLogin({
    required ValidateLoginBodyRequest bodyRequest,
  }) async {
    // try {
    //   var res = await execute(
    //     EndPoint.validateLogin,
    //     method: HttpMethod.post,
    //     queryParams: {
    //       "api_key": "712077dc796ceef687c9063293854405",
    //     },
    //     model: CreateTokenResponse(),
    //     data: bodyRequest.toJson(),
    //   );
    //   return res.success;
    // } catch (e) {
    //   debugPrint("Failed to validate login: $e");
    //   rethrow;
    // }
    return false;
  }
}

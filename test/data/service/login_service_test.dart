import 'dart:io';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_core_project/data/dio_client.dart';
import 'package:mvvm_core_project/data/model/api_error.dart';
import 'package:mvvm_core_project/data/model/auth/create_token_response.dart';
import 'package:mvvm_core_project/data/service/auth/login_service.dart';
import 'package:mvvm_core_project/utilities/network_result.dart';

void main() {
  late LoginService loginService;

  setUpAll(() {
    HttpOverrides.global = null;

    DioClient dioClient = DioClient();
    loginService = LoginService(api: dioClient);
  });

  group(
    "Login Service Test Cases",
    () {
      test(
        "Generate Token",
        () async {
          await loginService.generateToken(
            onSuccess: (res) {
              expect(res.requestToken, isNotEmpty);
            },
            onFailure: (error) {
              expect(error, isA<APIError>());
            },
          );
        },
      );
      test("Request Generate Token", () async {
        var res = await loginService.requestGenerateToken();
        switch (res) {
          case Success<CreateTokenResponse, APIError>(value: final res):
            expect(res.requestToken, isNotEmpty);
          case Failure<CreateTokenResponse, APIError>(error: final apiError):
            expect(apiError, isNull);
        }
      });
    },
  );
}

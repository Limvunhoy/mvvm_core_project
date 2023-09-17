import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_core_project/data/dio_client.dart';
import 'package:mvvm_core_project/data/model/api_error.dart';
import 'package:mvvm_core_project/data/repository/auth/login_repository_imp.dart';
import 'package:mvvm_core_project/data/service/auth/login_service.dart';
import 'package:mvvm_core_project/utilities/network_result.dart';

void main() {

  late LoginRepositoryImp loginRepositoryImp;

  setUpAll(() {
    HttpOverrides.global = null;

    DioClient dioClient = DioClient();
    LoginService loginService = LoginService(api: dioClient);
    loginRepositoryImp = LoginRepositoryImp(loginService);
  });

  group("Login Repository Test Cases", () {
    test("Generate Token Success", () async {
      await loginRepositoryImp.generateToken(resultCallback: (result) {
        switch (result) {
          case Success<String, APIError>(value: final token):
            expect(token, isNotEmpty);
          case Failure<String, APIError>(error: final apiError):
            expect(apiError, isNull);
        }
      });
    });
    test("Generate Token with Error Message", () async {
      await loginRepositoryImp.generateToken(resultCallback: (result) {
        switch (result) {
          case Success<String, APIError>(value: final token):
            expect(token, isEmpty);
          case Failure<String, APIError>(error: final apiError):
            expect(apiError.error.statusMessage, "Invalid API key: You must be granted a valid key.");
        }
      });
    });
    test("Request Generate Token Successfully", () async {
      var res = await loginRepositoryImp.requestGenerateToken();
      switch (res) {
        case Success<String, APIError>(value: final token):
          expect(token, isNotEmpty);
        case Failure<String, APIError>(error: final apiError):
          expect(apiError, isNull);
      }
    });
    test("Request Generate Token with Error Message", () async {
      var res = await loginRepositoryImp.requestGenerateToken();
      switch (res) {
        case Success<String, APIError>(value: final token):
          expect(token, isEmpty);
        case Failure<String, APIError>(error: final apiError):
          expect(apiError.error.statusMessage, "Invalid API key: You must be granted a valid key.");
      }
    });
  });
}
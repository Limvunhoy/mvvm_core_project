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
    test("Generate Token with Response as parameter callback functions",
        () async {
      await loginRepositoryImp.generateToken(
        resultCallback: (response) {
          switch (response) {
            case Success<String, APIError>(value: final res):
              expect(res, isNotEmpty);
            case Failure<String, APIError>(error: final error):
              expect(error, isNull);
          }
        },
      );
    });

    test("Generate Token with Response as sealed class in Dart3", () async {
      final result = await loginRepositoryImp.requestGenerateToken();
      switch (result) {
        case Success<String, APIError>(value: final res):
          expect(res, isNotEmpty);
        case Failure<String, APIError>(error: final error):
          expect(error, isNull);
      }
    });
  });
}
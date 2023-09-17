import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mvvm_core_project/data/model/api_error.dart';
import 'package:mvvm_core_project/data/model/auth/validate_login_body_request.dart';
import 'package:mvvm_core_project/utilities/api_error.dart';
import 'package:mvvm_core_project/utilities/failure.dart';
import 'package:mvvm_core_project/utilities/network_result.dart';

abstract class ILoginRepository {
  // Response as parameter callback functions
  Future<void> generateToken({required Function(Result<String, APIError>) resultCallback});
  // Response as seal class in Dart3
  Future<Result<String, APIError>> requestGenerateToken();
}

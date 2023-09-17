import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mvvm_core_project/data/model/api_error.dart';
import 'package:mvvm_core_project/data/model/auth/validate_login_body_request.dart';
import 'package:mvvm_core_project/utilities/api_error.dart';
import 'package:mvvm_core_project/utilities/failure.dart';
import 'package:mvvm_core_project/utilities/network_result.dart';

abstract class ILoginRepository {
  Future<Either<Error, String>> createToken();
  Future<Either<Error, bool>> validateLogin({required ValidateLoginBodyRequest bodyRequest});

  // sealed class sample
  // Future<Result<String, APIError>> generateToken();
  Future<void> generateToken({required Function(Result<String, APIError>) resultCallback});
  Future<Result<String, APIError>> requestGenerateToken();
}

import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mvvm_core_project/data/model/api_error.dart';
import 'package:mvvm_core_project/data/model/auth/create_token_response.dart';
import 'package:mvvm_core_project/data/model/auth/validate_login_body_request.dart';
import 'package:mvvm_core_project/data/service/auth/login_service.dart';
import 'package:mvvm_core_project/domain/repository/auth/login_repository.dart';
import 'package:mvvm_core_project/utilities/api_error.dart';
import 'package:mvvm_core_project/utilities/failure.dart';
import 'package:mvvm_core_project/utilities/network_result.dart';

class LoginRepositoryImp extends ILoginRepository {
  final LoginService _loginService;

  LoginRepositoryImp(this._loginService);

  // @override
  // Future<Either<Error, String>> createToken() async {
  //   var res = await _loginService.createToken();
  //   if (res.success && res.requestToken.isNotEmpty) {
  //     return Right(res.requestToken);
  //   } else {
  //     return const Left(ServerFailure("Could not create token"));
  //   }
  // }

  // Response as parameter callback functions
  @override
  Future<void> generateToken({required Function(Result<String, APIError>) resultCallback}) async {
    await _loginService.generateToken(
      onSuccess: (response) {
        // return Success(response.requestToken);
        resultCallback(Success(response.requestToken));
      },
      onFailure: (error) {
        resultCallback(Failure(error));
      },
    );
  }

  // Response as sealed class in Dart3
  @override
  Future<Result<String, APIError>> requestGenerateToken() async {
    final res = await _loginService.requestGenerateToken();
    switch (res) {
      case Success<CreateTokenResponse, APIError>(value: final response):
        return Success(response.requestToken);
      case Failure<CreateTokenResponse, APIError>(error: final apiError):
        return Failure(apiError);
    }
  }
}
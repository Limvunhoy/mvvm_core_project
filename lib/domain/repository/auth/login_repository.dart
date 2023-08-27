import 'package:dartz/dartz.dart';
import 'package:mvvm_core_project/data/model/auth/validate_login_body_request.dart';
import 'package:mvvm_core_project/utilities/failure.dart';
import 'package:mvvm_core_project/utilities/network_result.dart';

abstract class ILoginRepository {
  Future<Either<Failure, String>> createToken();
  Future<Either<Failure, bool>> validateLogin({required ValidateLoginBodyRequest bodyRequest});

  // sealed class sample
  Future<Result<String, Exception>> generateToken();
}

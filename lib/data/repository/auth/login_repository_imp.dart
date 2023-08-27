import 'package:dartz/dartz.dart';
import 'package:mvvm_core_project/data/model/auth/validate_login_body_request.dart';
import 'package:mvvm_core_project/data/service/auth/login_service.dart';
import 'package:mvvm_core_project/domain/repository/auth/login_repository.dart';
import 'package:mvvm_core_project/utilities/failure.dart';
import 'package:mvvm_core_project/utilities/network_result.dart';

class LoginRepositoryImp extends ILoginRepository {
  final LoginService loginService;

  LoginRepositoryImp(this.loginService);

  @override
  Future<Either<Failure, String>> createToken() async {
    var res = await loginService.createToken();
    if (res.success && res.requestToken.isNotEmpty) {
      return Right(res.requestToken);
    } else {
      return const Left(ServerFailure("Could not create token"));
    }
  }

  @override
  Future<Either<Failure, bool>> validateLogin({required ValidateLoginBodyRequest bodyRequest}) async {
    var isValid = await loginService.validateLogin(bodyRequest: bodyRequest);
    if (isValid) {
      return const Right(true);
    } else {
      return const Left(ServerFailure("Failed to validate login"));
    }
  }

  // sealed class sample
  @override
  Future<Result<String, Exception>> generateToken() async {
    var res = await loginService.createToken();
    if (res.success && res.requestToken.isNotEmpty) {
      return Success(res.requestToken);
    } else {
      return FailureException(Exception(res));
    }
  }
}
import 'package:dartz/dartz.dart';
import 'package:mvvm_core_project/domain/model/user_dto.dart';
import 'package:mvvm_core_project/utilities/failure.dart';

abstract class UserRepository {
  // Future<void> getUsers({required Function(List<UserDTO> users) onSuccess});
  Future<Either<Failure, List<UserDTO>>> getUers();
}

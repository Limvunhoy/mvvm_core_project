import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mvvm_core_project/data/model/user/user_response.dart';
import 'package:mvvm_core_project/data/service/user/user_service.dart';
import 'package:mvvm_core_project/domain/model/user_dto.dart';
import 'package:mvvm_core_project/domain/repository/user/user_repository.dart';
import 'package:mvvm_core_project/utilities/failure.dart';

class UserRepositoryImp extends UserRepository {
  UserRepositoryImp({
    required this.userService,
  });

  UserService userService;

  List<UserDTO> _mapUserDTO(UserResponse userResponse) {
    return userResponse.data
        .map((e) => UserDTO(
              email: e.email,
              firstName: e.firstname,
              lastName: e.lastname,
              avatar: e.avatar,
            ))
        .toList();
  }

  @override
  Future<Either<Failure, List<UserDTO>>> getUers() async {
    try {
      var res = await userService.fetchUsers();
      return Right(_mapUserDTO(res));
    } on SocketException {
      return const Left(ConnectionFailure("Failed to connect to the network"));
    } catch (e) {
      return const Left(ServerFailuer("Something went wrong!"));
    }
  }
}

import 'package:mvvm_core_project/data/model/user/user_response.dart';
import 'package:mvvm_core_project/data/service/user/user_service.dart';
import 'package:mvvm_core_project/domain/model/user_dto.dart';
import 'package:mvvm_core_project/domain/repository/user/user_repository.dart';

class UserRepositoryImp extends UserRepository {
  UserRepositoryImp({
    required this.userService,
  });

  UserService userService;

  @override
  Future<void> getUsers({required Function(List<UserDTO> users) onSuccess}) async {
    await userService.fetchUsers(onSuccess: (res) async {
      return onSuccess(_mapUserDTO(res));
    });
  }

  List<UserDTO> _mapUserDTO(UserResponse userResponse) {
    return userResponse.data
        .map((e) => UserDTO(email: e.email, username: "${e.firstname} ${e.lastname}", avatar: e.avatar))
        .toList();
  }
}

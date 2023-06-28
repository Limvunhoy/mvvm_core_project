import 'package:mvvm_core_project/domain/model/user_dto.dart';

abstract class UserRepository {
  Future<void> getUsers({required Function(List<UserDTO> users) onSuccess});
}

import 'package:mvvm_core_project/constants/endpoints.dart';
import 'package:mvvm_core_project/data/base_api.dart';
import 'package:mvvm_core_project/data/model/user/user_response.dart';
import 'package:mvvm_core_project/data/service/base_service.dart';

class UserService extends BaseService {
  UserService({required DioClient api}) : super(api: api);

  fetchUsers({required Function(UserResponse userResponse) onSuccess}) async {
    await execute<UserResponse>(EndPoint.users, model: UserResponse(), onSuccess: (res) {
      return onSuccess(res);
    });
  }
}

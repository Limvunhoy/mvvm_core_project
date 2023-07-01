import 'package:mvvm_core_project/constants/endpoints.dart';
import 'package:mvvm_core_project/data/dio_client.dart';
import 'package:mvvm_core_project/data/model/user/user_response.dart';
import 'package:mvvm_core_project/data/service/base_service.dart';

class UserService extends BaseService {
  UserService({required DioClient api}) : super(api: api);

  Future<UserResponse> fetchUsers() async {
    // await execute<UserResponse>(EndPoint.users, model: UserResponse(), onSuccess: (res) {
    //   return onSuccess(res);
    // });
    try {
      var res = await execute(EndPoint.users, model: UserResponse());
      return res;
    } catch (e) {
      rethrow;
    }
  }
}

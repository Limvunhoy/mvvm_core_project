import 'package:mvvm_core_project/data/dio_client.dart';
import 'package:mvvm_core_project/data/service/base_service.dart';

class LoginService extends BaseService {
  LoginService({required DioClient api}) : super(api: api);
}

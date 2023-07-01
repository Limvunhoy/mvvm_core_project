import 'package:mockito/annotations.dart';
import 'package:mvvm_core_project/data/service/user/user_service.dart';
import 'package:mvvm_core_project/domain/repository/user/user_repository.dart';

@GenerateMocks([
  UserService,
  UserRepository,
])
void main() {}

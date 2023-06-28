import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_core_project/data/base_api.dart';
import 'package:mvvm_core_project/data/repository/user/user_repository_imp.dart';
import 'package:mvvm_core_project/data/service/user/user_service.dart';
import 'package:mvvm_core_project/domain/model/user_dto.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserRepositoryImp userRepositoryImp;
  late DioClient baseApi;

  setUpAll(() {
    HttpOverrides.global = null;
    baseApi = DioClient();
    UserService userService = UserService(api: baseApi);
    userRepositoryImp = UserRepositoryImp(userService: userService);
  });

  group("UserRepositoryImp Test", () {
    test('Fetch Users Test Case', () async {
      await userRepositoryImp.getUsers(onSuccess: (users) async {
        expect(users, isNotNull);
        expect(users, isA<List<UserDTO>>());
      });
    });
  });
}

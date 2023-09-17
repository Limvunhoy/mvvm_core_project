import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_core_project/data/dio_client.dart';
import 'package:mvvm_core_project/data/repository/auth/login_repository_imp.dart';
import 'package:mvvm_core_project/data/service/auth/login_service.dart';
import 'package:mvvm_core_project/domain/repository/auth/login_repository.dart';
import 'package:mvvm_core_project/presentation/viewmodel/login_viewmodel.dart';

void main() {

  late LoginViewModel viewModel;

  setUpAll(() {
    HttpOverrides.global = null;

    DioClient dioClient = DioClient();
    LoginService loginService = LoginService(api: dioClient);
    ILoginRepository loginRepository = LoginRepositoryImp(loginService);
    viewModel = LoginViewModel(loginRepository);
  });

  group("Login ViewModel Test Cases", () {
    test("Generate Token as Response Parameter Callback Functions", () async {
      await viewModel.generateToken();
      expect(viewModel.accessToken, isNotEmpty);
    });

    test("Generate Token as Response of Future Sealed Class", () async {
      final result = await viewModel.requestGenerateToken();
      expect(viewModel.accessToken, isNotEmpty);
    });
  });
}
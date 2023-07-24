import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_core_project/core/locator.dart';
import 'package:mvvm_core_project/presentation/viewmodel/user_viewmodel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late UserViewModel viewmodel;

  setUpAll(() {
    HttpOverrides.global = null;
    setupDependencies();
    viewmodel = locator.get<UserViewModel>();
  });

  group("User Viewmodel Empty Users:", () {
    test("Get Users", () async {
      expect(viewmodel.users, isEmpty);
    });

    test("Get Users Successfully", () async {
      await viewmodel.getUsers();
      debugPrint("Users: ${viewmodel.users}");
      expect(viewmodel.users, isNotEmpty);
    });
  });
}

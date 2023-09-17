import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_core_project/data/model/api_error.dart';
import 'package:mvvm_core_project/data/model/auth/validate_login_body_request.dart';
import 'package:mvvm_core_project/data/repository/auth/login_repository_imp.dart';
import 'package:mvvm_core_project/domain/repository/auth/login_repository.dart';
import 'package:mvvm_core_project/utilities/api_error.dart';
import 'package:mvvm_core_project/utilities/debouncer.dart';
import 'package:mvvm_core_project/utilities/network_result.dart';

class LoginViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final ILoginRepository repository;

  final TextEditingController txtUsernameController = TextEditingController();
  final TextEditingController txtPasswordController = TextEditingController();
  bool isHidePassword = true;

  bool get enableSignInButton => (txtUsernameController.text.isNotEmpty &&
      txtPasswordController.text.isNotEmpty);

  String accessToken = "";

  LoginViewModel(this.repository);

  onTogglePassword() {
    isHidePassword = !isHidePassword;
    notifyListeners();
  }

  String? validateUsername(String? username) {
    if (username?.isEmpty ?? false) {
      return "Please enter username";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password?.isEmpty ?? false) {
      return "Please enter password";
    } else if (password!.length < 6) {
      return "Password length must be at least 6 characters";
    }
    return null;
  }

  onUsernameTextChanged(String value) {
    Debouncer.run(
        milliseconds: 300,
        action: () {
          txtUsernameController.text = value;
          txtUsernameController.selection = TextSelection.fromPosition(
            TextPosition(
              offset: txtUsernameController.text.length,
            ),
          );
          notifyListeners();
        });
  }

  onPasswordTextChanged(String value) {
    Debouncer.run(
        milliseconds: 300,
        action: () {
          txtPasswordController.text = value;
          txtPasswordController.selection = TextSelection.fromPosition(
            TextPosition(
              offset: txtPasswordController.text.length,
            ),
          );
          notifyListeners();
        });
  }

  onLogin() async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    // var res = await repository.createToken();
    // res.fold(
    //   (failure) => debugPrint("Error: $failure"),
    //   (token) async {
    //     log("Required Token: $token");
    //     final bodyRequest = ValidateLoginBodyRequest(
    //       // uesrname: "Life_AsDev",
    //       // password: "TMDB@122536",
    //       username: txtUsernameController.text,
    //       password: txtPasswordController.text,
    //       requestToken: token,
    //     );
    //     final res = await repository.validateLogin(bodyRequest: bodyRequest);
    //     res.fold((l) => debugPrint("Invalid token"), (r) => log("Valid token"));
    //   },
    // );
  }

  generateToken() async {
    await repository.generateToken(resultCallback: (result) {
      switch (result) {
        case Success<String, APIError>(value: final token):
          accessToken = token;
        case Failure<String, APIError>(error: final error):
          // TODO: Handle API error here...
      }
    });
  }

  requestGenerateToken() async {
    final result = await repository.requestGenerateToken();
    switch (result) {
      case Success<String, APIError>(value: final token):
        accessToken = token;
      case Failure<String, APIError>(error: final error):
      // TODO: Handle API error here...
    }
  }

  onGenerateToken() async {
    final res = await repository.requestGenerateToken();
    switch (res) {
      case Success<String, APIError>(value: final responseToken):
        accessToken = responseToken;
      case Failure<String, APIError>(error: final error):
        // TODO: Handle error here...
    }
    notifyListeners();
  }
}

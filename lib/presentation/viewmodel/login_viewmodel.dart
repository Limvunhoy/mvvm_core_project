import 'package:flutter/material.dart';
import 'package:mvvm_core_project/utilities/debouncer.dart';

class LoginViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final TextEditingController txtUsernameController = TextEditingController();
  final TextEditingController txtPasswordController = TextEditingController();
  bool isHidePassword = true;
  bool get enableSignInButton => (txtUsernameController.text.isNotEmpty && txtPasswordController.text.isNotEmpty);

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
    }
    return null;
  }

  onUsernameTextChanged(String value) {
    Debouncer.run(
        milliseconds: 300,
        action: () {
          txtUsernameController.text = value;
          notifyListeners();
        });
  }

  onPasswordTextChanged(String value) {
    Debouncer.run(
        milliseconds: 300,
        action: () {
          txtPasswordController.text = value;
          notifyListeners();
        });
  }

  onLogin() {
    if (formKey.currentState!.validate()) {
      return;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:mvvm_core_project/domain/model/user_dto.dart';
import 'package:mvvm_core_project/domain/repository/user/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  List<UserDTO> users = [];

  UserViewModel(this._userRepository);

  getUsers() async {
    var res = await _userRepository.getUers();
    res.fold((failure) {
      debugPrint("Failed to get users: ${failure.message}");
    }, (users) {
      users = users;
      notifyListeners();
    });
  }
}

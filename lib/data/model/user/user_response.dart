import 'package:mvvm_core_project/data/model/base_model.dart';

class UserResponse implements IBaseModel {
  late int page;
  late int totalPage;
  late List<UserDataResponse> data;

  UserResponse();

  UserResponse.init({required this.page, required this.totalPage, required this.data});

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse.init(
        page: json["page"],
        totalPage: json["total_pages"],
        data: List<UserDataResponse>.from(json["data"].map((e) => UserDataResponse.fromJson(e))),
      );

  @override
  fromJson(Map<String, dynamic> json) {
    return UserResponse.fromJson(json);
  }
}

class UserDataResponse implements IBaseModel {
  late int id;
  late String email;
  late String firstname;
  late String lastname;
  late String avatar;

  UserDataResponse({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  });

  factory UserDataResponse.fromJson(Map<String, dynamic> json) => UserDataResponse(
        id: json["id"],
        email: json["email"],
        firstname: json["first_name"],
        lastname: json["last_name"],
        avatar: json["avatar"],
      );

  @override
  fromJson(Map<String, dynamic> json) {
    return UserDataResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstname,
        "last_name": lastname,
        "avatar": avatar,
      };
}

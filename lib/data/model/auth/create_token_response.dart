import 'package:mvvm_core_project/data/model/base_model.dart';

class CreateTokenResponse extends IBaseModel {
  late bool success;
  late String expiresAt;
  late String requestToken;

  CreateTokenResponse();

  CreateTokenResponse.init({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  factory CreateTokenResponse.fromJson(Map<String, dynamic> json) => CreateTokenResponse.init(
        success: json["success"],
        expiresAt: json["expires_at"],
        requestToken: json["request_token"],
      );

  @override
  fromJson(Map<String, dynamic> json) {
    return CreateTokenResponse.fromJson(json);
  }
}

class ValidateLoginBodyRequest {
  final String username;
  final String password;
  final String requestToken;

  ValidateLoginBodyRequest({
    required this.username,
    required this.password,
    required this.requestToken,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "request_token": requestToken,
      };
}

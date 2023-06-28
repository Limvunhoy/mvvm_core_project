class UserDTO {
  final String email;
  final String username;
  final String avatar;

  UserDTO({
    required this.email,
    required this.username,
    required this.avatar,
  });

  @override
  String toString() {
    return '''
{
  "email": $email,
  "username": $username,
  "avatar": $avatar,
}''';
  }
}

import 'package:equatable/equatable.dart';

class UserDTO extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserDTO({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  @override
  String toString() {
    return '''
{
  "email": $email,
  "first_name": $firstName,
  "last_name": $lastName,
  "avatar": $avatar,
}''';
  }

  @override
  List<Object?> get props => [email, firstName, lastName, avatar];
}

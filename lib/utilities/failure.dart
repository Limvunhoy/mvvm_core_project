import 'package:equatable/equatable.dart';

abstract class Error extends Equatable {
  final String message;
  const Error(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Error {
  const ServerFailure(String message) : super(message);
}

class ConnectionFailure extends Error {
  const ConnectionFailure(String message) : super(message);
}

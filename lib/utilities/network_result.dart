import 'package:dio/dio.dart';
import 'package:mvvm_core_project/data/model/api_error.dart';

sealed class Result<S, E extends APIError> {
  const Result();
}

final class Success<S, E extends APIError> extends Result<S, E> {
  const Success(this.value);

  final S value;
}

final class Failure<S, E extends APIError> extends Result<S, E> {
  const Failure(this.error);

  final E error;
}

// final class Failure<S, E extends Exception> extends Result<S, E> {
//   const Failure(this.exception);
//
//   final E exception;
// }
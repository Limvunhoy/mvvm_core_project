sealed class Result<S, E extends Exception> {
  const Result();
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);

  final S value;
}

final class FailureException<S, E extends Exception> extends Result<S, E> {
  const FailureException(this.exception);

  final E exception;
}
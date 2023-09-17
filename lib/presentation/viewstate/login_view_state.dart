sealed class LoginViewState {}

class LoadingViewState extends LoginViewState {}

class SuccessViewState extends LoginViewState {
  final String data;

  SuccessViewState(this.data);
}

class FailureViewState extends LoginViewState {
  final String error;

  FailureViewState(this.error);
}
enum ViewStateStatus {
  loading,
  complete,
  error,
}

class ViewState<T> {
  ViewStateStatus? status;
  T? data;
  String? message;

  ViewState(this.status, this.data, this.message);

  // Factory constructor
  ViewState.loading() : status = ViewStateStatus.loading;
  ViewState.complete(this.data) : status = ViewStateStatus.complete;
  ViewState.error(this.message) : status = ViewStateStatus.error;

  @override
  String toString() {
    return "Status: $status \n Message: $message \n Data: $data";
  }
}

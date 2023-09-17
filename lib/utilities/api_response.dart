class ApiResponse<T> {
  final bool isSuccess;
  final int? statusCode;
  final T? data;
  final String? errorMessage;

  ApiResponse.success({this.statusCode, this.data}) : isSuccess = true, errorMessage = null;
  ApiResponse.error({this.statusCode, this.errorMessage}) : isSuccess = false, data = null;

}

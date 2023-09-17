import 'package:dio/dio.dart';

class CustomDioException extends DioException {
  final int? statusCode;
  final String? errorMessage;

  CustomDioException({
    this.statusCode = 400,
    this.errorMessage,
  }) : super(requestOptions: RequestOptions(), error: errorMessage);
}

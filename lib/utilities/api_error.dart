// import 'package:dio/dio.dart';
//
// abstract class IError {
//   final int? statusCode;
//   final String? message;
//   final Response<dynamic>? errorResponse;
//
//   IError(this.statusCode, this.message, this.errorResponse);
// }
//
// class ApiError extends IError {
//   ApiError({int? statusCode, String? message, Response<dynamic>? errorResponse})
//       : super(statusCode, message, errorResponse);
//
//   factory ApiError.fromDioException(DioException dioException) {
//     switch (dioException.type) {
//       case DioException.badResponse:
//         return ApiError(
//             statusCode: dioException.response?.statusCode,
//             message: dioException.message,
//             errorResponse: dioException.response);
//       default:
//         return ApiError(
//             statusCode: dioException.response?.statusCode,
//             message: dioException.message,
//             errorResponse: dioException.response);
//     }
//   }
//
// }
class APIError {
  final int? statusCode;
  final _ServerError error;

  APIError({this.statusCode, required Map<String, dynamic> json})
      : error = _ServerError.fromJson(json);
}

class _ServerError {
  final bool success;
  final int statusCode;
  final String statusMessage;

  _ServerError(this.success, this.statusCode, this.statusMessage);

  factory _ServerError.fromJson(Map<String, dynamic> json) => _ServerError(
        json["success"],
        json["status_code"],
        json["status_message"],
      );
}

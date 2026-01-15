class ApiResponse<T> {
  final T? data;
  final ApiError? error;
  final bool success;
  final int statusCode;

  ApiResponse({required this.data, required this.error, required this.success, required this.statusCode});
}

class ApiError {
  final String message;

  ApiError({required this.message});

  factory ApiError.fromJson(dynamic json) {
    return ApiError(message: json.toString());
  }
}

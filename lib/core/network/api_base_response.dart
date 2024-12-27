class ApiResponse<T> {
  final T? data;
  final String message;
  final bool success;
  final List<String>? errors;

  ApiResponse({
    required this.data,
    required this.message,
    required this.success,
    this.errors,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic)? fromJsonT) {
    return ApiResponse<T>(
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'])
          : null,
      message: json['message'],
      success: json['success'],
      errors: json['errors'] != null ? List<String>.from(json['errors']) : null,
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/core/network/app_exception.dart';

class ApiHelper {
  static Future<Either<AppException, ApiResponse<T>>> handleApiCall<T>(
      Future<ApiResponse<T>> apiCall) async {
    try {
      final response = await apiCall;
      return Right(response); // Başarılı durum
    } on DioException catch (e) {
      // DioException durumlarını yönetir ve özel hata mesajları döndürür
      if (e.response != null) {
        switch (e.response?.statusCode) {
          case 400:
            return Left(AppException(
                message: 'Bad Request: The data sent is invalid.',
                statusCode: 400,
                identifier: 'BadRequest'));
          case 401:
            return Left(AppException(
                message: 'Unauthorized: Invalid credentials.',
                statusCode: 401,
                identifier: 'Unauthorized'));
          case 403:
            return Left(AppException(
                message:
                    'Forbidden: You do not have permission to access this resource.',
                statusCode: 403,
                identifier: 'Forbidden'));
          case 404:
            return Left(AppException(
                message: 'Resource not found: Check the URL or request.',
                statusCode: 404,
                identifier: 'NotFound'));
          case 408:
            return Left(AppException(
                message:
                    'Request Timeout: The server took too long to respond.',
                statusCode: 408,
                identifier: 'Timeout'));
          case 500:
            return Left(AppException(
                message: 'Internal Server Error: Please try again later.',
                statusCode: 500,
                identifier: 'ServerError'));
          default:
            return Left(AppException(
                message:
                    'Unexpected error: ${e.response?.statusCode} ${e.message}',
                statusCode: e.response?.statusCode ?? 0,
                identifier: 'UnexpectedError'));
        }
      } else {
        // Ağ sorunları veya bağlantı hatalarını yönetir
        return Left(AppException(
            message: 'Network error: ${e.message}',
            statusCode: 0,
            identifier: 'NetworkError'));
      }
    } catch (e) {
      // Beklenmeyen hataları yönetir
      return Left(AppException(
          message: 'An unexpected error occurred: $e',
          statusCode: 0,
          identifier: 'UnexpectedError'));
    }
  }
}

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:waterwin_app/core/extentions/to_bearer.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/core/network/api_helper.dart';
import 'package:waterwin_app/core/network/app_exception.dart';
import 'package:waterwin_app/presentations/account_page/presentations/admin_page/data/admin_data_source.dart';
import 'package:waterwin_app/presentations/account_page/presentations/admin_page/domain/model/referance_admin_model.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/auth_local_repository.dart';

@injectable
class AdminRemoteRepository {
  final AdminDataSource _adminDataSource;
  final AuthLocalRepository _authLocalRepository;

  AdminRemoteRepository(this._adminDataSource, this._authLocalRepository);

  Future<Either<AppException, ApiResponse>> addPoints(int count) async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) return const Left(CustomException('Token is missing'));
      return await ApiHelper.handleApiCall(
        _adminDataSource.addPoints(token.toBearer(), count),
      );
    } catch (e) {
      log(e.toString());
      return const Left(CustomException('Failed to add points'));
    }
  }

  Future<Either<AppException, ApiResponse>> deletePointsByUserId() async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) return const Left(CustomException('Token is missing'));
      return await ApiHelper.handleApiCall(
        _adminDataSource.deletePointsByUserId(token.toBearer()),
      );
    } catch (e) {
      log(e.toString());
      return const Left(CustomException('Failed to delete points'));
    }
  }

  Future<Either<AppException, ApiResponse>> deletePaymentRequest(
      int paymentRequestId) async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) return const Left(CustomException('Token is missing'));
      return await ApiHelper.handleApiCall(
        _adminDataSource.deletePaymentRequest(
            token.toBearer(), paymentRequestId),
      );
    } catch (e) {
      log(e.toString());
      return const Left(CustomException('Failed to delete payment request'));
    }
  }

  Future<Either<AppException, ApiResponse>> addReference() async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) return const Left(CustomException('Token is missing'));
      return await ApiHelper.handleApiCall(
        _adminDataSource.addReference(token.toBearer()),
      );
    } catch (e) {
      log(e.toString());
      return const Left(CustomException('Failed to add reference'));
    }
  }

  Future<Either<AppException, ApiResponse>> addReferancePoints(
      int refUserId, int count) async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) return const Left(CustomException('Token is missing'));
      return await ApiHelper.handleApiCall(
        _adminDataSource.addReferancePoints(token.toBearer(), refUserId, count),
      );
    } catch (e) {
      log(e.toString());
      return const Left(CustomException('Failed to add reference points'));
    }
  }

  Future<Either<AppException, ApiResponse>> deleteReference(
      int refUserId) async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) return const Left(CustomException('Token is missing'));
      return await ApiHelper.handleApiCall(
        _adminDataSource.deleteReference(token.toBearer(), refUserId),
      );
    } catch (e) {
      log(e.toString());
      return const Left(CustomException('Failed to delete reference'));
    }
  }

  Future<Either<AppException, ApiResponse>> getReferences() async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) return const Left(CustomException('Token is missing'));
      return await ApiHelper.handleApiCall(
        _adminDataSource.getReferences(token.toBearer()),
      );
    } catch (e) {
      log(e.toString());
      return const Left(CustomException('Failed to get references'));
    }
  }

  Future<Either<AppException, ApiResponse>> getPaymentRequests() async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) return const Left(CustomException('Token is missing'));
      return await ApiHelper.handleApiCall(
        _adminDataSource.getPaymentRequests(token.toBearer()),
      );
    } catch (e) {
      log(e.toString());
      return const Left(CustomException('Failed to get payment requests'));
    }
  }

  Future<Either<AppException, ApiResponse>>
      deleteUserAndReferencePoints() async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) return const Left(CustomException('Token is missing'));
      return await ApiHelper.handleApiCall(
        _adminDataSource.deleteUserAndReferencePoints(token.toBearer()),
      );
    } catch (e) {
      log(e.toString());
      return const Left(
          CustomException('Failed to delete user and reference points'));
    }
  }

  Future<Either<AppException, ApiResponse>> deleteOnlyReferencePoints() async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) return const Left(CustomException('Token is missing'));
      return await ApiHelper.handleApiCall(
        _adminDataSource.deleteOnlyReferencePoints(token.toBearer()),
      );
    } catch (e) {
      log(e.toString());
      return const Left(
          CustomException('Failed to delete only reference points'));
    }
  }

  // Parsing functions (Assuming models are already defined somewhere)
  ReferanceAdminUserInfoModel? parseUserInfo(ApiResponse apiResponse) {
    if (apiResponse.data != null && apiResponse.data is Map<String, dynamic>) {
      return ReferanceAdminUserInfoModel.fromJson(apiResponse.data);
    }
    return null;
  }

  List<ReferanceAdminModel> parseReferences(ApiResponse apiResponse) {
    if (apiResponse.data != null && apiResponse.data is List) {
      return (apiResponse.data as List)
          .map((e) => ReferanceAdminModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  List<ReferanceAdminPaymentModel> parsePaymentRequests(
      ApiResponse apiResponse) {
    if (apiResponse.data != null && apiResponse.data is List) {
      return (apiResponse.data as List)
          .map((e) =>
              ReferanceAdminPaymentModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  ReferanceAdminDeletedModel? parseDeletedReference(ApiResponse apiResponse) {
    if (apiResponse.data != null && apiResponse.data is Map<String, dynamic>) {
      return ReferanceAdminDeletedModel.fromJson(apiResponse.data);
    }
    return null;
  }
}

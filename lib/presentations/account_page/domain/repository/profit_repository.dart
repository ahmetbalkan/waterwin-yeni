import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:waterwin_app/core/extentions/to_bearer.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/core/network/api_helper.dart';
import 'package:waterwin_app/core/network/app_exception.dart';
import 'package:waterwin_app/presentations/account_page/data/local/profit_data_dao.dart';
import 'package:waterwin_app/presentations/account_page/data/remote/profit_data_source.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/payment_information_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/payment_request_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/profit_data_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/profit_statistic_model.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/auth_local_repository.dart';

@injectable
class ProfitRepository {
  final ProfitDataSource _profitDataSource;
  final AuthLocalRepository _authLocalRepository;
  final ProfitDao _profitDao;

  ProfitRepository(
    this._profitDataSource,
    this._authLocalRepository,
    this._profitDao,
  );

  /// Fetch and refresh ProfitDataModel
  Future<Either<AppException, ProfitDataModel>>
      fetchAndRefreshProfitData() async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) {
        return const Left(CustomException('Token is missing'));
      }

      final result = await ApiHelper.handleApiCall(
        _profitDataSource.getProfitData(token.toBearer()),
      );

      return result.fold(
        (exception) => Left(exception),
        (apiResponse) async {
          final profitDataFromApi = apiResponse.data;

          if (profitDataFromApi != null) {
            final now = DateTime.now();
            final updatedProfitData = profitDataFromApi.copyWith(
              refreshDate: now.add(const Duration(hours: 1)).toIso8601String(),
            );

            await _profitDao.refreshProfitData(updatedProfitData);

            return Right(updatedProfitData);
          } else {
            return const Left(CustomException('API returned no data'));
          }
        },
      );
    } catch (e) {
      return Left(CustomException('An unexpected error occurred: $e'));
    }
  }

  /// Fetch and refresh ProfitStatisticModels
  Future<Either<AppException, List<ProfitStatisticModel>>>
      fetchAndRefreshProfitStatistics() async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) {
        return const Left(CustomException('Token is missing'));
      }

      final result = await ApiHelper.handleApiCall(
        _profitDataSource.getMonthlyStatistics(token.toBearer()),
      );

      return result.fold(
        (exception) => Left(exception),
        (apiResponse) async {
          final profitStatisticsFromApi = apiResponse.data;

          if (profitStatisticsFromApi != null) {
            final profitData = await _profitDao.getProfitData();
            final profitDataId = profitData?.id ?? 1;

            final profitStatistics = profitStatisticsFromApi
                .map((stat) => stat.copyWith(profitDataId: profitDataId))
                .toList();

            await _profitDao.refreshProfitStatistics(profitStatistics);

            return Right(profitStatistics);
          } else {
            return const Left(
                CustomException('API returned no statistics data'));
          }
        },
      );
    } catch (e) {
      return Left(CustomException('An unexpected error occurred: $e'));
    }
  }

  /// Submit a payment request
  Future<Either<AppException, ApiResponse>> paymentRequest() async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) {
        return const Left(CustomException('Token is missing'));
      }

      final result = await ApiHelper.handleApiCall(
        _profitDataSource.paymentRequest(token.toBearer()),
      );

      return result.fold(
        (exception) => Left(exception),
        (apiResponse) => Right(apiResponse),
      );
    } catch (e) {
      return Left(CustomException('An unexpected error occurred: $e'));
    }
  }

  /// Fetch payment requests
  Future<Either<AppException, List<PaymentRequestModel>>>
      fetchPaymentRequest() async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) {
        return const Left(CustomException('Token is missing'));
      }

      final result = await ApiHelper.handleApiCall(
        _profitDataSource.getPaymentRequests(token.toBearer()),
      );

      return result.fold(
        (exception) => Left(exception),
        (apiResponse) async {
          final paymentRequestsFromApi = apiResponse.data;

          if (paymentRequestsFromApi != null &&
              paymentRequestsFromApi.isNotEmpty) {
            // Eğer veri başarıyla geldiyse direkt döndür
            return Right(paymentRequestsFromApi);
          } else {
            return const Left(
                CustomException('API returned no payment requests'));
          }
        },
      );
    } catch (e) {
      return Left(CustomException('An unexpected error occurred: $e'));
    }
  }

  /// Cancel a payment request
  Future<Either<AppException, ApiResponse>> cancelPaymentRequest(
      int paymentRequestId) async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) {
        return const Left(CustomException('Token is missing'));
      }

      final result = await ApiHelper.handleApiCall(
        _profitDataSource.cancelPaymentRequest(
          token.toBearer(),
          paymentRequestId,
        ),
      );

      return result.fold(
        (exception) => Left(exception),
        (apiResponse) async {
          return Right(apiResponse);
        },
      );
    } catch (e) {
      return Left(CustomException('An unexpected error occurred: $e'));
    }
  }

  /// Wallet change request
  Future<Either<AppException, ApiResponse>> walletChangeRequest() async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) {
        return const Left(CustomException('Token is missing'));
      }

      final result = await ApiHelper.handleApiCall(
        _profitDataSource.walletChangeRequest(token.toBearer()),
      );

      return result.fold(
        (exception) => Left(exception),
        (apiResponse) => Right(apiResponse),
      );
    } catch (e) {
      return Left(CustomException('An unexpected error occurred: $e'));
    }
  }

  /// Wallet change confirmation
  Future<Either<AppException, ApiResponse>> walletChangeConfirm(
      String tokenCode, String walletAddress) async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) {
        return const Left(CustomException('Token is missing'));
      }

      final result = await ApiHelper.handleApiCall(
        _profitDataSource.walletChangeConfirm(
          token.toBearer(),
          tokenCode,
          walletAddress,
        ),
      );

      return result.fold(
        (exception) => Left(exception),
        (apiResponse) => Right(apiResponse),
      );
    } catch (e) {
      return Left(CustomException('An unexpected error occurred: $e'));
    }
  }

  /// Clear all profit data
  Future<void> clearProfitData() async {
    await _profitDao.clearAllProfitData();
  }

  Future<Either<AppException, PaymentInformationModel>>
      getPaymentInformation() async {
    try {
      final token = await _authLocalRepository.getToken();
      if (token == null) {
        return const Left(CustomException('Token is missing'));
      }

      final result = await ApiHelper.handleApiCall(
        _profitDataSource.getPaymentInformation(token.toBearer()),
      );

      return result.fold(
        (exception) => Left(exception),
        (apiResponse) async {
          final paymentRequestsFromApi = apiResponse.data;

          if (paymentRequestsFromApi != null) {
            // Eğer veri başarıyla geldiyse direkt döndür
            return Right(paymentRequestsFromApi);
          } else {
            return const Left(
                CustomException('API returned no payment requests'));
          }
        },
      );
    } catch (e) {
      return Left(CustomException('An unexpected error occurred: $e'));
    }
  }
}

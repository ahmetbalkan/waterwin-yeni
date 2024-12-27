import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:waterwin_app/core/extentions/to_bearer.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/core/network/api_helper.dart';
import 'package:waterwin_app/core/network/app_exception.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/auth_local_repository.dart';
import 'package:waterwin_app/presentations/information_page/data/data_source/dtos/calculate_dto.dart';
import 'package:waterwin_app/presentations/information_page/data/data_source/dtos/information_dto.dart';
import 'package:waterwin_app/presentations/information_page/data/data_source/remote/information_data_source.dart';
import 'package:waterwin_app/presentations/information_page/domain/model/information_model.dart';
import 'package:waterwin_app/presentations/information_page/domain/repository/local/information_local_repository.dart';

@injectable
class InformationRemoteRepository {
  final InformationDataSource _informationdataSource;
  final InformationLocalRepository _informationLocalRepository;
  final AuthLocalRepository _authLocalRepository;

  InformationRemoteRepository(this._informationdataSource,
      this._authLocalRepository, this._informationLocalRepository);

  Future<Either<AppException, ApiResponse<InformationModel>>> addInformation(
      InformationDto information) async {
    try {
      var token = await _authLocalRepository.getToken();

      log(jsonEncode(information));
      log(token.toString());

      if (token == null) {
        return const Left(CustomException('Token is missing'));
      } else {
        final result = await ApiHelper.handleApiCall(_informationdataSource
            .addInformation(token.toBearer(), information));

        return await result.fold(
          (exception) => Left(exception), // Hata durumunda hatayı döndür
          (apiResponse) async {
            if (apiResponse.data != null) {
              await _informationLocalRepository
                  .insertInformation(apiResponse.data!);
            }
            return Right(apiResponse);
          },
        );
      }
    } catch (e) {
      return const Left(
          CustomException('An error occurred while trying to add point'));
    }
  }

  /// Güncellenen bilgileri sunucuya gönderir ve başarı durumunda yerel veritabanına kaydeder.
  Future<Either<AppException, ApiResponse<InformationModel>>> updateInformation(
    Map<String, dynamic> informationData,
  ) async {
    try {
      // Token'i yerel depolamadan al
      var token = await _authLocalRepository.getToken();

      if (token == null) {
        // Token yoksa hata döndür
        return const Left(CustomException('Token is missing'));
      } else {
        // Sunucuya güncelleme isteğini gönder
        final result = await ApiHelper.handleApiCall(
          _informationdataSource.updateInformation(
              token.toBearer(), informationData),
        );

        // API çağrısının sonucunu işle
        return await result.fold(
          // Hata durumunda hatayı döndür
          (exception) => Left(exception),
          // Başarılıysa yanıtı yerel veritabanına yaz
          (apiResponse) async {
            if (apiResponse.data != null) {
              await _informationLocalRepository
                  .insertInformation(apiResponse.data!);
            }
            return Right(apiResponse);
          },
        );
      }
    } catch (e) {
      log(e.toString()); // Hata durumunda logla
      return const Left(CustomException(
          'An error occurred while trying to update information'));
    }
  }

  Future<Either<AppException, ApiResponse<int>>> calculateDailyGoal(
      CalculateInfoDto calculateInfoData) async {
    try {
      var token = await _authLocalRepository.getToken();

      log(jsonEncode(calculateInfoData));
      log(token.toString());

      if (token == null) {
        return const Left(CustomException('Token is missing'));
      } else {
        final result = await ApiHelper.handleApiCall(_informationdataSource
            .calculateDailyGoal(token.toBearer(), calculateInfoData));

        return await result.fold(
          (exception) => Left(exception), // Hata durumunda hatayı döndür
          (apiResponse) async {
            return Right(apiResponse);
          },
        );
      }
    } catch (e) {
      return const Left(
          CustomException('An error occurred while trying to add point'));
    }
  }
}

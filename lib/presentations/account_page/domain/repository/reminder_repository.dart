import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:waterwin_app/core/extentions/to_bearer.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/core/network/api_helper.dart';
import 'package:waterwin_app/core/network/app_exception.dart';

import 'package:waterwin_app/presentations/account_page/data/remote/drink_reminder_data_source.dart';
import 'package:waterwin_app/presentations/account_page/domain/dto/reminder_dto.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/reminder_model.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/auth_local_repository.dart';

@injectable
class ReminderRepository {
  final DrinkReminderDataSource _drinkReminderDataSource;
  final AuthLocalRepository _authLocalRepository;

  ReminderRepository(this._drinkReminderDataSource, this._authLocalRepository);

  /// Hatırlatıcı verilerini almak için
  Future<Either<AppException, ApiResponse<ReminderModel>>>
      getReminderData() async {
    try {
      // Token'ı authLocalRepository'den alıyoruz
      var token = await _authLocalRepository.getToken();

      if (token == null) {
        return const Left(CustomException('Token is missing'));
      } else {
        // API çağrısını gerçekleştiriyoruz ve türü açıkça belirtiyoruz
        final result = await ApiHelper.handleApiCall(
          _drinkReminderDataSource.getReminderData(token.toBearer()),
        );

        // Sonuçları işleyin
        return result.fold(
          (exception) => Left(exception), // Hata durumunda hatayı döndür
          (apiResponse) {
            if (apiResponse.success) {
              return Right(apiResponse);
            } else {
              return Left(CustomException(apiResponse.message));
            }
          }, // Başarı durumunda yanıtı döndür
        );
      }
    } catch (e) {
      // Genel bir hata yakalama durumu
      return const Left(
        CustomException(
            'An unexpected error occurred while fetching reminder data'),
      );
    }
  }

  /// Hatırlatıcı verilerini güncellemek için
  Future<Either<AppException, ApiResponse<ReminderModel>>> updateReminder({
    required ReminderDto reminderDto,
  }) async {
    try {
      // Token'ı authLocalRepository'den alıyoruz
      var token = await _authLocalRepository.getToken();

      if (token == null) {
        return const Left(CustomException('Token is missing'));
      } else {
        // API çağrısını gerçekleştiriyoruz ve türü açıkça belirtiyoruz
        final result = await ApiHelper.handleApiCall(
          _drinkReminderDataSource.updateReminder(
            token.toBearer(),
            reminderDto,
          ),
        );

        // Sonuçları işleyin
        return result.fold(
          (exception) => Left(exception), // Hata durumunda hatayı döndür
          (apiResponse) => Right(apiResponse), // Başarı durumunda yanıtı döndür
        );
      }
    } catch (e) {
      // Genel bir hata yakalama durumu
      return const Left(
        CustomException(
            'An unexpected error occurred while updating reminder data'),
      );
    }
  }
}

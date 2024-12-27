import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:waterwin_app/core/extentions/to_bearer.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/core/network/api_helper.dart';
import 'package:waterwin_app/core/network/app_exception.dart';
import 'package:waterwin_app/presentations/account_page/data/remote/change_password_data_source.dart';
import 'package:waterwin_app/presentations/account_page/domain/dto/change_password_dto.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/model/auth_response_model.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/auth_local_repository.dart';

@injectable
class ChangePasswordRepository {
  final ChangePasswordDataSource _changePasswordDataSource;
  final AuthLocalRepository _authLocalRepository;

  ChangePasswordRepository(
      this._changePasswordDataSource, this._authLocalRepository);

  Future<Either<AppException, ApiResponse<AuthResponseModel>>> changePassword({
    required ChangePasswordDto changePasswordDto,
  }) async {
    try {
      // Token'ı authLocalRepository'den alıyoruz
      var token = await _authLocalRepository.getToken();

      if (token == null) {
        return const Left(CustomException('Token is missing'));
      } else {
        // API çağrısını gerçekleştiriyoruz ve türü açıkça belirtiyoruz
        final result = await ApiHelper.handleApiCall(
          _changePasswordDataSource.changePassword(
              token.toBearer(), changePasswordDto),
        );

        // Sonuçları işleyin
        return result.fold(
          (exception) => Left(exception), // Hata durumunda hatayı döndür
          (apiResponse) async {
            // Eğer API yanıtında yeni bir token ve refresh_token varsa güncelle
            final newToken = apiResponse.data?.token;
            final newRefreshToken = apiResponse.data?.refreshToken;

            if (newToken != null && newRefreshToken != null) {
              await _authLocalRepository.updateToken(newToken, newRefreshToken);
            }

            return Right(apiResponse); // Başarı durumunda yanıtı döndür
          },
        );
      }
    } catch (e) {
      // Genel bir hata yakalama durumu
      return const Left(
        CustomException('An unexpected error occurred during password change'),
      );
    }
  }
}

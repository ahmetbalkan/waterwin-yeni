import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/core/network/api_helper.dart';
import 'package:waterwin_app/core/network/app_exception.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/data/data_source/remote/auth_data_source.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/model/auth_response_model.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/auth_local_repository.dart';

@injectable
class AuthRepository {
  final AuthDataSource _authDataSource;
  final AuthLocalRepository _authLocalRepository;

  AuthRepository(this._authDataSource, this._authLocalRepository);

  Future<Either<AppException, ApiResponse<AuthResponseModel>>>
      refreshAuthToken() async {
    // Local veritabanından refresh token'ı al
    final refreshToken = await _authLocalRepository.getRefreshToken();

    // Eğer refresh token yoksa hata döndür
    if (refreshToken == null) {
      return Left(AppException(
        identifier: "NoRefreshToken",
        statusCode: 404,
        message: "No refresh token found.",
      ));
    }

    // API çağrısını gerçekleştirin
    return await ApiHelper.handleApiCall(
      _authDataSource.refreshtoken(refreshToken),
    );
  }
}

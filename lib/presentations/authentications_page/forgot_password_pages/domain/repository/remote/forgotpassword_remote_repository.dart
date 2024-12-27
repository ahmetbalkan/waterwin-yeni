import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/core/network/api_helper.dart';
import 'package:waterwin_app/core/network/app_exception.dart';
import 'package:waterwin_app/presentations/authentications_page/forgot_password_pages/data/remote/forgotpassword_data_source.dart';
import 'package:waterwin_app/presentations/information_page/domain/repository/local/information_local_repository.dart';

@injectable
class ForgotpasswordRemoteRepository {
  final ForgotPasswordDataSource _forgotPasswordDataSource;

  final InformationLocalRepository _informationLocalRepository;

  ForgotpasswordRemoteRepository(
      this._forgotPasswordDataSource, this._informationLocalRepository);
  Future<Either<AppException, ApiResponse>> forgotPassword(String email) async {
    try {
      final result = await ApiHelper.handleApiCall(
        _forgotPasswordDataSource.forgotpassword(email),
      );

      return result.fold(
        (exception) => Left(exception), // Hata durumunda hatayı döndür
        (apiResponse) async {
          return Right(apiResponse); // Başarılı durumu döndür
        },
      );
    } catch (e) {
      return const Left(
          CustomException('An error occurred while trying to send the email'));
    }
  }

  Future<Either<AppException, ApiResponse>> changepassword(String email,
      String password, String token, String passwordconfirmation) async {
    try {
      final result = await ApiHelper.handleApiCall(
        _forgotPasswordDataSource.resetpassword(
            email, password, token, passwordconfirmation),
      );

      return result.fold(
        (exception) => Left(exception), // Hata durumunda hatayı döndür
        (apiResponse) async {
          return Right(apiResponse); // Başarılı durumu döndür
        },
      );
    } catch (e) {
      return const Left(
          CustomException('An error occurred while trying to send the email'));
    }
  }

  Future<Either<AppException, ApiResponse>> validateResetToken(
      String email, String token) async {
    try {
      final result = await ApiHelper.handleApiCall(
        _forgotPasswordDataSource.validateresettoken(email, token),
      );

      return result.fold(
        (exception) => Left(exception), // Hata durumunda hatayı döndür
        (apiResponse) async {
          return Right(apiResponse); // Başarılı durumu döndür
        },
      );
    } catch (e) {
      return const Left(
          CustomException('An error occurred while trying to send the email'));
    }
  }

  Future<Either<AppException, ApiResponse>> resetpassword(
      String email, String password, String repassword, String token) async {
    try {
      final result = await ApiHelper.handleApiCall(
        _forgotPasswordDataSource.resetpassword(
          email,
          password,
          repassword,
          token,
        ),
      );

      return result.fold(
        (exception) => Left(exception), // Hata durumunda hatayı döndür
        (apiResponse) async {
          return Right(apiResponse); // Başarılı durumu döndür
        },
      );
    } catch (e) {
      return const Left(
          CustomException('An error occurred while trying to send the email'));
    }
  }
}

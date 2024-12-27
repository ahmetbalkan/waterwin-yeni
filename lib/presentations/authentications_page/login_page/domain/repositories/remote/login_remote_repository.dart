import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/core/network/api_helper.dart';
import 'package:waterwin_app/core/network/app_exception.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/data/data_source/remote/login_data_source.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/model/auth_response_model.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/login_local_repository.dart';
import 'package:waterwin_app/presentations/information_page/domain/repository/local/information_local_repository.dart';
import 'package:waterwin_app/presentations/point_page/domain/repository/remote/point_remote_repository.dart';

@injectable
class LoginRepository {
  final LoginDataSource _loginDataSource;
  final LoginLocalRepository _loginLocalRepository;
  final InformationLocalRepository _informationLocalRepository;
  final PointRemoteRepository _pointRemoteRepository;

  LoginRepository(this._loginDataSource, this._loginLocalRepository,
      this._informationLocalRepository, this._pointRemoteRepository);

  Future<Either<AppException, ApiResponse<AuthResponseModel>>> login({
    required String email,
    required String password,
  }) async {
    try {
      // API çağrısını gerçekleştirin
      final result = await ApiHelper.handleApiCall(
        _loginDataSource.login(email, password),
      );

      // Sonuçları işleyin
      return await result.fold(
        (exception) => Left(exception), // Hata durumunda hatayı döndür
        (apiResponse) async {
          // Eğer başarı durumuysa ve veri mevcutsa, locale kaydedin
          if (apiResponse.data != null) {
            await _loginLocalRepository.insertAuthData(apiResponse.data!);

            if (apiResponse.data!.information != null) {
              await _informationLocalRepository.insertInformation(
                apiResponse.data!.information!,
              );
            }

            log(apiResponse.data?.token.toString() ?? '');

            // getPoints çağrısı ve hata kontrolü
            final pointsResult = await _pointRemoteRepository.getPoints();
            pointsResult.fold(
              (pointException) => Left(pointException),
              (_) => const Right(null),
            );

            return Right(apiResponse); // Başarılı durumu döndür
          } else {
            // Eğer veri yoksa, hata döndür
            return Left(
              CustomException('Authentication data is missing in response'),
            );
          }
        },
      );
    } catch (e) {
      // Genel bir hata yakalama durumu
      return const Left(
        CustomException('An unexpected error occurred during login'),
      );
    }
  }
}

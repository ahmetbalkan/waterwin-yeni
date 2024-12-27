import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:waterwin_app/core/extentions/to_bearer.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/core/network/api_helper.dart';
import 'package:waterwin_app/core/network/app_exception.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/auth_local_repository.dart';
import 'package:waterwin_app/presentations/referance_page/data/referance_data_source.dart';
import 'package:waterwin_app/presentations/referance_page/domain/model/all_referance_and_code_model.dart';

@injectable
class ReferanceRemoteRepository {
  final ReferanceDataSource _referanceDataSource;
  final AuthLocalRepository _authLocalRepository;

  ReferanceRemoteRepository(
      this._referanceDataSource, this._authLocalRepository);
  Future<Either<AppException, ApiResponse<AllReferralPointsAndUserCodeModel>>>
      getReferalsAndCodes() async {
    try {
      var token = await _authLocalRepository.getToken();

      if (token == null) {
        return const Left(CustomException('Token is missing'));
      } else {
        final result = await ApiHelper.handleApiCall(
            _referanceDataSource.getReferalsAndCodes(token.toBearer()));

        return await result.fold(
          (exception) => Left(exception), // Hata durumunda hatayı döndür
          (apiResponse) async {
            // Başarı durumu ve data kontrolü
            if (apiResponse.data != null) {
              return Right(apiResponse); // Başarı durumunu döndür
            } else {
              return const Left(CustomException('Data is missing'));
            }
          },
        );
      }
    } catch (e) {
      return const Left(
          CustomException('An error occurred while trying to add point'));
    }
  }
}

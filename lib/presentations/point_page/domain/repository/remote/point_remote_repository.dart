import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:waterwin_app/core/extentions/to_bearer.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/core/network/api_helper.dart';
import 'package:waterwin_app/core/network/app_exception.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/auth_local_repository.dart';
import 'package:waterwin_app/presentations/point_page/data/dto/point_dto.dart';
import 'package:waterwin_app/presentations/point_page/data/remote/point_data_source.dart';
import 'package:waterwin_app/presentations/point_page/domain/model/point_model.dart';
import 'package:waterwin_app/presentations/point_page/domain/model/point_page_model.dart';
import 'package:waterwin_app/presentations/point_page/domain/repository/local/point_local_repository.dart';

@injectable
class PointRemoteRepository {
  final PointDataSource _pointDataSource;
  final PointLocalRepository _pointLocalRepository;

  final AuthLocalRepository _authLocalRepository;

  PointRemoteRepository(this._pointDataSource, this._pointLocalRepository,
      this._authLocalRepository);

  Future<Either<AppException, ApiResponse<List<PointResponseModel>>>>
      getPoints() async {
    try {
      var token = await _authLocalRepository.getToken();

      if (token == null) {
        return const Left(CustomException('Token is missing'));
      } else {
        final result = await ApiHelper.handleApiCall(_pointDataSource.getPoints(
          token.toBearer(),
        ));
        return await result.fold(
          (exception) => Left(exception), // Hata durumunda hatayı döndür
          (apiResponse) async {
            // Başarı durumu ve data kontrolü
            if (apiResponse.data != null) {
              await _pointLocalRepository.insertPoints(apiResponse.data!);
            }
            return Right(apiResponse); // Başarı durumunu döndür
          },
        );
      }
    } catch (e) {
      return const Left(
          CustomException('An error occurred while trying to fetch points'));
    }
  }

  Future<Either<AppException, ApiResponse<PointResponseModel>>> addPoint(
      PointDto point) async {
    try {
      var token = await _authLocalRepository.getToken();

      if (token == null) {
        return const Left(CustomException('Token is missing'));
      } else {
        final result = await ApiHelper.handleApiCall(
            _pointDataSource.addPoint(token.toBearer(), point));

        return await result.fold(
          (exception) => Left(exception), // Hata durumunda hatayı döndür
          (apiResponse) async {
            await _pointLocalRepository.insertPoint(apiResponse.data!);
            return Right(apiResponse);
          },
        );
      }
    } catch (e) {
      return const Left(
          CustomException('An error occurred while trying to add point'));
    }
  }

  Future<Either<AppException, ApiResponse<PointPageModel>>>
      getUserAndReferralPoints() async {
    try {
      var token = await _authLocalRepository.getToken();

      if (token == null) {
        return const Left(CustomException('Token is missing'));
      } else {
        final result = await ApiHelper.handleApiCall(
            _pointDataSource.getUserAndReferralPoints(token.toBearer()));

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

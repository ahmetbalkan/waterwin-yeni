import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waterwin_app/core/constants/app_constants.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/presentations/referance_page/domain/model/all_referance_and_code_model.dart';

part 'referance_data_source.g.dart';

@singleton
@RestApi(baseUrl: baseUrl)
abstract class ReferanceDataSource {
  @factoryMethod
  factory ReferanceDataSource(Dio dio) = _ReferanceDataSource;

  @GET("referance/getreferalsandcodes")
  Future<ApiResponse<AllReferralPointsAndUserCodeModel>> getReferalsAndCodes(
    @Header("Authorization") String token,
  );
}

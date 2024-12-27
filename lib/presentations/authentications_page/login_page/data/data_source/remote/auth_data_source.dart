import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waterwin_app/core/constants/app_constants.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/model/auth_response_model.dart';

part 'auth_data_source.g.dart';

@singleton
@RestApi(baseUrl: baseUrl)
abstract class AuthDataSource {
  @factoryMethod
  factory AuthDataSource(Dio dio) = _AuthDataSource;

  @POST("refresh-token")
  Future<ApiResponse<AuthResponseModel>> refreshtoken(
    @Query("refresh_token") String refreshtoken,
  );
}

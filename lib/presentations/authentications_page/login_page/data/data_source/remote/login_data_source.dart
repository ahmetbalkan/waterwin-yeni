import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waterwin_app/core/constants/app_constants.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/model/auth_response_model.dart';

part 'login_data_source.g.dart';

@singleton
@RestApi(baseUrl: baseUrl)
abstract class LoginDataSource {
  @factoryMethod
  factory LoginDataSource(Dio dio) = _LoginDataSource;

  @POST("login")
  Future<ApiResponse<AuthResponseModel>> login(
    @Query("email") String email,
    @Query("password") String password,
  );
}

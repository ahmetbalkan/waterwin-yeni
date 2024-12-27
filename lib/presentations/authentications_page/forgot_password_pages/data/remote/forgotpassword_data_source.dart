import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waterwin_app/core/constants/app_constants.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/model/auth_response_model.dart';

part 'forgotpassword_data_source.g.dart';

@singleton
@RestApi(baseUrl: baseUrl)
abstract class ForgotPasswordDataSource {
  @factoryMethod
  factory ForgotPasswordDataSource(Dio dio) = _ForgotPasswordDataSource;

  @POST("forgot-password")
  Future<ApiResponse<AuthResponseModel>> forgotpassword(
    @Query("email") String email,
  );

  @POST("reset-password")
  Future<ApiResponse<AuthResponseModel>> resetpassword(
    @Query("email") String email,
    @Query("password") String password,
    @Query("password_confirmation") String password_confirmation,
    @Query("token") String token,
  );

  @POST("validate-reset-token")
  Future<ApiResponse<AuthResponseModel>> validateresettoken(
    @Query("email") String email,
    @Query("token") String token,
  );
}

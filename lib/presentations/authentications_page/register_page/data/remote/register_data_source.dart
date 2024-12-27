import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waterwin_app/core/constants/app_constants.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/model/auth_response_model.dart';

part 'register_data_source.g.dart';

@singleton
@RestApi(baseUrl: baseUrl)
abstract class RegisterDataSource {
  @factoryMethod
  factory RegisterDataSource(Dio dio) = _RegisterDataSource;

  @POST("register")
  Future<ApiResponse<AuthResponseModel>> register(
    @Query("email") String email,
    @Query("password") String password,
  );
}

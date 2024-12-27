import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waterwin_app/core/constants/app_constants.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/presentations/account_page/domain/dto/change_password_dto.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/model/auth_response_model.dart';

part 'change_password_data_source.g.dart';

@singleton
@RestApi(baseUrl: baseUrl)
abstract class ChangePasswordDataSource {
  @factoryMethod
  factory ChangePasswordDataSource(Dio dio) = _ChangePasswordDataSource;

  @POST("/account/changepassword")
  Future<ApiResponse<AuthResponseModel>> changePassword(
    @Header("Authorization") String token,
    @Body() ChangePasswordDto changePasswordDto,
  );
}

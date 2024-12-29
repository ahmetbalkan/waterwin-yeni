import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waterwin_app/core/constants/app_constants.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/presentations/account_page/domain/dto/fcm_token_dto.dart';
import 'package:waterwin_app/presentations/account_page/domain/dto/reminder_dto.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/reminder_model.dart';

part 'drink_reminder_data_source.g.dart';

@singleton
@RestApi(baseUrl: baseUrl)
abstract class DrinkReminderDataSource {
  @factoryMethod
  factory DrinkReminderDataSource(Dio dio) = _DrinkReminderDataSource;

  @GET("reminder/get")
  Future<ApiResponse<ReminderModel>> getReminderData(
    @Header("Authorization") String token,
  );

  @POST("reminder/update")
  Future<ApiResponse<ReminderModel>> updateReminder(
    @Header("Authorization") String token,
    @Body() ReminderDto reminderDto,
  );

  @GET("/reminder/update-token")
  Future<ApiResponse<ReminderModel>> updateFCMToken(
    @Header("Authorization") String token,
    @Query("fcmtoken") String fcmtoken,
  );
}

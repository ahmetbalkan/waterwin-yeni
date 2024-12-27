import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waterwin_app/core/constants/app_constants.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/presentations/information_page/data/data_source/dtos/calculate_dto.dart';
import 'package:waterwin_app/presentations/information_page/data/data_source/dtos/information_dto.dart';
import 'package:waterwin_app/presentations/information_page/domain/model/information_model.dart';

part 'information_data_source.g.dart';

@singleton
@RestApi(baseUrl: baseUrl)
abstract class InformationDataSource {
  @factoryMethod
  factory InformationDataSource(Dio dio) = _InformationDataSource;

  @POST("information/add")
  Future<ApiResponse<InformationModel>> addInformation(
    @Header("Authorization") String token,
    @Body() InformationDto information,
  );

  @POST("information/calculate-dailygoal")
  Future<ApiResponse<int>> calculateDailyGoal(
    @Header("Authorization") String token,
    @Body() CalculateInfoDto information,
  );

  @PUT("/information/update")
  Future<ApiResponse<InformationModel>> updateInformation(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> data,
  );
}

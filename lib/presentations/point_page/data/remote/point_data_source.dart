import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waterwin_app/core/constants/app_constants.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/presentations/point_page/data/dto/point_dto.dart';
import 'package:waterwin_app/presentations/point_page/domain/model/point_model.dart';
import 'package:waterwin_app/presentations/point_page/domain/model/point_page_model.dart';

part 'point_data_source.g.dart';

@singleton
@RestApi(baseUrl: baseUrl)
abstract class PointDataSource {
  @factoryMethod
  factory PointDataSource(Dio dio) = _PointDataSource;

  @GET("point/getall")
  Future<ApiResponse<List<PointResponseModel>>> getPoints(
    @Header("Authorization") String token,
  );

  @POST("/point/add")
  Future<ApiResponse<PointResponseModel>> addPoint(
    @Header("Authorization") String token,
    @Body() PointDto point,
  );

  @GET("/point/getuserandreferralpoints")
  Future<ApiResponse<PointPageModel>> getUserAndReferralPoints(
    @Header("Authorization") String token,
  );
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waterwin_app/core/constants/app_constants.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';

part 'admin_data_source.g.dart';

@singleton
@RestApi(baseUrl: baseUrl)
abstract class AdminDataSource {
  @factoryMethod
  factory AdminDataSource(Dio dio) = _AdminDataSource;

  @POST("admin/addpoint")
  @FormUrlEncoded()
  Future<ApiResponse> addPoints(
    @Header("Authorization") String token,
    @Field("count") int count,
  );

  @POST("admin/delete-point-by-user")
  Future<ApiResponse> deletePointsByUserId(
    @Header("Authorization") String token,
  );

  @POST("admin/delete-payment-request")
  @FormUrlEncoded()
  Future<ApiResponse> deletePaymentRequest(
    @Header("Authorization") String token,
    @Field("payment_request_id") int paymentRequestId,
  );

  @POST("admin/add-referance")
  Future<ApiResponse> addReference(
    @Header("Authorization") String token,
  );

  @POST("admin/add-referance-point")
  @FormUrlEncoded()
  Future<ApiResponse> addReferancePoints(
    @Header("Authorization") String token,
    @Field("ref_user_id") int refUserId,
    @Field("count") int count,
  );

  @POST("admin/delete-reference")
  @FormUrlEncoded()
  Future<ApiResponse> deleteReference(
    @Header("Authorization") String token,
    @Field("ref_user_id") int refUserId,
  );

  @GET("admin/get-references")
  Future<ApiResponse> getReferences(
    @Header("Authorization") String token,
  );

  @GET("admin/get-payment-requests")
  Future<ApiResponse> getPaymentRequests(
    @Header("Authorization") String token,
  );

  @POST("admin/delete-user-and-reference-points")
  Future<ApiResponse> deleteUserAndReferencePoints(
    @Header("Authorization") String token,
  );

  @POST("admin/delete-only-reference-points")
  Future<ApiResponse> deleteOnlyReferencePoints(
    @Header("Authorization") String token,
  );
}

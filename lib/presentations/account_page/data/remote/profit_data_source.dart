import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waterwin_app/core/constants/app_constants.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/payment_information_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/payment_request_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/profit_data_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/profit_statistic_model.dart';

part 'profit_data_source.g.dart';

@singleton
@RestApi(baseUrl: baseUrl)
abstract class ProfitDataSource {
  @factoryMethod
  factory ProfitDataSource(Dio dio) = _ProfitDataSource;

  @GET("payment/getprofitdata")
  Future<ApiResponse<ProfitDataModel>> getProfitData(
    @Header("Authorization") String token,
  );

  @POST("payment/request")
  Future<ApiResponse> paymentRequest(
    @Header("Authorization") String token,
  );

  @GET("payment/getmonthlystatistics")
  Future<ApiResponse<List<ProfitStatisticModel>>> getMonthlyStatistics(
    @Header("Authorization") String token,
  );

  @GET("payment/payment-requests")
  Future<ApiResponse<List<PaymentRequestModel>>> getPaymentRequests(
    @Header("Authorization") String token,
  );

  @POST("payment/cancel-payment-request")
  Future<ApiResponse> cancelPaymentRequest(
    @Header("Authorization") String token,
    @Query("payment_request_id") int paymentRequestId,
  );

  @POST("payment/wallet-change-request")
  Future<ApiResponse> walletChangeRequest(
    @Header("Authorization") String token,
  );

  @POST("payment/wallet-change-confirm")
  Future<ApiResponse> walletChangeConfirm(
    @Header("Authorization") String token,
    @Query("token") String tokenCode,
    @Query("wallet") String walletAddress,
  );

  @GET("payment/fetch-payment-information")
  Future<ApiResponse<PaymentInformationModel>> getPaymentInformation(
    @Header("Authorization") String token,
  );
}

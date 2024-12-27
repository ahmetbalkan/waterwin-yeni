part of 'profit_cubit.dart';

enum ProfitDataStatus { initial, loading, loaded, error }

enum ProfitStatisticsStatus { initial, loading, loaded, error }

enum PaymentStatus { initial, loading, success, error }

enum PaymentRequestStatus { initial, loading, success, error }

@freezed
class ProfitState with _$ProfitState {
  const factory ProfitState({
    @Default(ProfitDataStatus.initial) ProfitDataStatus dataStatus,
    @Default(ProfitStatisticsStatus.initial)
    ProfitStatisticsStatus statisticsStatus,
    @Default(PaymentStatus.initial) PaymentStatus paymentStatus,
    @Default(PaymentRequestStatus.initial)
    PaymentRequestStatus paymentRequestStatus,
    ProfitDataModel? profitData,
    List<ProfitStatisticModel>? profitStatistics,
    List<PaymentRequestModel>? paymentRequests,
    PaymentInformationModel? paymentInformation,
    @Default(true) bool isWalletChangeRequest,
    String? dataErrorMessage,
    String? statisticsErrorMessage,
    String? paymentErrorMessage,
    String? walletErrorMessage,
    String? walletConfirmationErrorMessage,
    String? paymentRequestErrorMessage,
    String? paymentInformationErrorMessage,
  }) = _ProfitState;

  factory ProfitState.initial() => const ProfitState();
}

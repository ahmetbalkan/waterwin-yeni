part of 'wallet_cubit.dart';

enum WalletRequestStatus { initial, loading, success, error, showcode }

enum WalletConfirmationStatus { initial, loading, success, error, showcode }

enum PaymentRequestStatus { initial, loading, success, error }

enum PaymentInformationStatus { initial, loading, loaded, error }

@freezed
class WalletState with _$WalletState {
  const factory WalletState({
    @Default(WalletRequestStatus.initial)
    WalletRequestStatus walletRequestStatus,
    @Default(WalletConfirmationStatus.initial)
    WalletConfirmationStatus walletRequestConfirmationStatus,
    @Default(PaymentInformationStatus.initial)
    PaymentInformationStatus paymentInformationStatus,
    String? walletErrorMessage,
    String? walletConfirmationErrorMessage,
    String? paymentInformationErrorMessage,
    PaymentInformationModel? paymentInformation,
    @Default(true) bool isWalletChangeRequest,
  }) = _WalletState;

  factory WalletState.initial() => const WalletState();
}

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/payment_information_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/repository/profit_repository.dart';

part 'wallet_state.dart';
part 'wallet_cubit.freezed.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit({
    ProfitRepository? profitRepository,
  }) : super(WalletState.initial()) {
    _profitRepository = profitRepository ?? getIt<ProfitRepository>();
  }

  late final ProfitRepository _profitRepository;

  Future<void> fetchPaymentInformation() async {
    emit(state.copyWith(
      paymentInformationStatus: PaymentInformationStatus.loading,
      paymentInformationErrorMessage: null,
    ));

    final result = await _profitRepository.getPaymentInformation();
    result.fold(
      (exception) {
        emit(state.copyWith(
          paymentInformationStatus: PaymentInformationStatus.error,
          paymentInformationErrorMessage: exception.message,
        ));
      },
      (paymentInformation) {
        emit(state.copyWith(
          paymentInformationStatus: PaymentInformationStatus.loaded,
          paymentInformation: paymentInformation,
        ));
      },
    );
  }

  void changeWalletTextfieldStatus() {
    emit(state.copyWith(
      isWalletChangeRequest: !state.isWalletChangeRequest,
      paymentInformationStatus: PaymentInformationStatus.initial,
      paymentInformationErrorMessage: null,
      walletRequestStatus: WalletRequestStatus.initial,
      walletErrorMessage: null,
      walletRequestConfirmationStatus: WalletConfirmationStatus.initial,
      walletConfirmationErrorMessage: null,
    ));
  }

  /// Wallet Change Request
  Future<void> walletChangeRequest(String walletAddress) async {
    // Eğer status zaten `loading` ise tekrar emit etmeye gerek yok
    if (state.walletRequestStatus == WalletRequestStatus.loading) return;

    // Eski confirmation status'u sıfırlayın
    emit(state.copyWith(
      walletRequestStatus: WalletRequestStatus.loading,
      walletRequestConfirmationStatus: WalletConfirmationStatus.initial,
      walletErrorMessage: null,
      walletConfirmationErrorMessage: null,
    ));

    final result = await _profitRepository.walletChangeRequest();

    result.fold(
      (exception) {
        if (state.walletRequestStatus != WalletRequestStatus.error) {
          emit(state.copyWith(
            walletRequestStatus: WalletRequestStatus.error,
            walletErrorMessage: exception.message,
          ));
        }
      },
      (_) {
        if (state.walletRequestStatus != WalletRequestStatus.success) {
          emit(state.copyWith(
            walletRequestStatus: WalletRequestStatus.success,
          ));
        }
      },
    );
  }

  /// Confirm Wallet Change
  Future<void> confirmWalletChange(
      String tokenCode, String walletAddress) async {
    if (state.walletRequestConfirmationStatus ==
        WalletConfirmationStatus.loading) return;

    emit(state.copyWith(
      walletRequestConfirmationStatus: WalletConfirmationStatus.loading,
      walletConfirmationErrorMessage: null,
    ));

    final result =
        await _profitRepository.walletChangeConfirm(tokenCode, walletAddress);

    result.fold(
      (exception) {
        if (state.walletRequestConfirmationStatus !=
            WalletConfirmationStatus.error) {
          emit(state.copyWith(
            walletRequestConfirmationStatus: WalletConfirmationStatus.error,
            walletConfirmationErrorMessage: exception.message,
          ));
        }
      },
      (response) {
        if (response.success) {
          emit(state.copyWith(
            walletRequestConfirmationStatus: WalletConfirmationStatus.success,
            paymentInformation: state.paymentInformation!.copyWith(
              walletId: walletAddress,
            ),
            isWalletChangeRequest: true,
          ));
        } else {
          emit(state.copyWith(
            walletRequestConfirmationStatus: WalletConfirmationStatus.error,
            walletConfirmationErrorMessage: response.message,
          ));
        }
      },
    );
  }
}

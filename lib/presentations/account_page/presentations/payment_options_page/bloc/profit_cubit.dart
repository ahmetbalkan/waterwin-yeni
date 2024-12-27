import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/payment_information_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/payment_request_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/profit_data_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/profit_statistic_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/repository/profit_repository.dart';

part 'profit_state.dart';
part 'profit_cubit.freezed.dart';

class ProfitCubit extends Cubit<ProfitState> {
  ProfitCubit({
    ProfitRepository? profitRepository,
  }) : super(ProfitState.initial()) {
    _profitRepository = profitRepository ?? getIt<ProfitRepository>();
  }

  late final ProfitRepository _profitRepository;

  /// Refresh profit data
  Future<void> refreshProfitData() async {
    emit(state.copyWith(
      dataStatus: ProfitDataStatus.loading,
      dataErrorMessage: null,
    ));

    final result = await _profitRepository.fetchAndRefreshProfitData();
    result.fold(
      (exception) {
        emit(state.copyWith(
          dataStatus: ProfitDataStatus.error,
          dataErrorMessage: exception.message,
        ));
      },
      (profitData) {
        emit(state.copyWith(
          dataStatus: ProfitDataStatus.loaded,
          profitData: profitData,
        ));
      },
    );
  }

  /// Refresh profit statistics
  Future<void> refreshProfitStatistics() async {
    emit(state.copyWith(
      statisticsStatus: ProfitStatisticsStatus.loading,
      statisticsErrorMessage: null,
    ));

    final result = await _profitRepository.fetchAndRefreshProfitStatistics();
    result.fold(
      (exception) {
        emit(state.copyWith(
          statisticsStatus: ProfitStatisticsStatus.error,
          statisticsErrorMessage: exception.message,
        ));
      },
      (profitStatistics) {
        emit(state.copyWith(
          statisticsStatus: ProfitStatisticsStatus.loaded,
          profitStatistics: profitStatistics,
        ));
      },
    );
  }

  /// Request Payment
  Future<void> requestPayment() async {
    emit(state.copyWith(
      paymentStatus: PaymentStatus.loading,
      paymentErrorMessage: null,
    ));

    final result = await _profitRepository.paymentRequest();

    result.fold(
      (exception) {
        emit(state.copyWith(
          paymentStatus: PaymentStatus.error,
          paymentErrorMessage: exception.message,
        ));
      },
      (_) async {
        emit(state.copyWith(
          paymentStatus: PaymentStatus.success,
        ));
        await refreshAll();
      },
    );
  }

  /// Cancel Payment Request
  Future<void> cancelPaymentRequest(int paymentRequestId) async {
    emit(state.copyWith(
      paymentRequestStatus: PaymentRequestStatus.loading,
      paymentRequestErrorMessage: null,
    ));

    final result =
        await _profitRepository.cancelPaymentRequest(paymentRequestId);

    result.fold(
      (exception) {
        emit(state.copyWith(
          paymentRequestStatus: PaymentRequestStatus.error,
          paymentRequestErrorMessage: exception.message,
        ));
      },
      (data) async {
        if (data.success) {
          final updatedRequests =
              List<PaymentRequestModel>.from(state.paymentRequests ?? [])
                ..removeWhere((request) => request.id == paymentRequestId);

          emit(state.copyWith(
            paymentRequestStatus: PaymentRequestStatus.success,
            paymentRequests: updatedRequests,
            paymentRequestErrorMessage: null,
          ));

          await refreshAll();
        } else {
          emit(state.copyWith(
            paymentRequestStatus: PaymentRequestStatus.error,
            paymentRequestErrorMessage: data.message,
          ));
        }
      },
    );
  }

  /// Fetch Payment Requests
  Future<void> fetchPaymentRequests() async {
    emit(state.copyWith(
      paymentRequestStatus: PaymentRequestStatus.loading,
      paymentRequestErrorMessage: null,
    ));

    final result = await _profitRepository.fetchPaymentRequest();
    result.fold(
      (exception) {
        emit(state.copyWith(
          paymentRequestStatus: PaymentRequestStatus.error,
          paymentRequestErrorMessage: exception.message,
        ));
      },
      (paymentRequests) {
        final sortedRequests = List<PaymentRequestModel>.from(paymentRequests)
          ..sort((a, b) {
            final createdAtA =
                a.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0);
            final createdAtB =
                b.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0);
            return createdAtB.compareTo(createdAtA);
          });

        emit(state.copyWith(
          paymentRequestStatus: PaymentRequestStatus.success,
          paymentRequests: sortedRequests,
        ));
      },
    );
  }

  /// Refresh All Data
  Future<void> refreshAll() async {
    await Future.wait([
      refreshProfitData(),
      refreshProfitStatistics(),
    ]);
  }
}

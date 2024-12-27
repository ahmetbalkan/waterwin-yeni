import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/point_page/domain/repository/remote/point_remote_repository.dart';

part 'point_state.dart';
part 'point_cubit.freezed.dart';

class PointCubit extends Cubit<PointState> {
  PointCubit({
    PointRemoteRepository? pointRemoteRepository,
  }) : super(PointState.initial()) {
    _pointRemoteRepository =
        pointRemoteRepository ?? getIt<PointRemoteRepository>();
  }

  late final PointRemoteRepository _pointRemoteRepository;

  Future<void> getReferalAndUserPointsWithDelay() async {
    if (state.isButtonEnabled) {
      emit(state.copyWith(status: PointStatus.loading, isButtonEnabled: false));
      await getReferalAndUserPoints();
      try {
        // 30 saniye sonra butonu yeniden etkinleştir
        Future.delayed(const Duration(seconds: 30), () {
          emit(state.copyWith(isButtonEnabled: true));
        });
      } catch (e) {
        // Hata durumunu güncelle
        emit(state.copyWith(
          status: PointStatus.error,
          errorMessage: e.toString(),
          isButtonEnabled: true,
        ));
      }
    }
  }

  Future<void> getReferalAndUserPoints() async {
    emit(state.copyWith(status: PointStatus.loading));
    final result = await _pointRemoteRepository.getUserAndReferralPoints();

    result.fold((error) {
      emit(state.copyWith(
        status: PointStatus.error,
        errorMessage: error.message,
      ));
    }, (response) {
      if (response.data != null) {
        emit(state.copyWith(
          status: PointStatus.loaded,
          gainedPoints: response.data!.totalPoint!,
          referancePoints: response.data!.totalReferralPoints!,
          totalPoints: response.data!.grandTotalPoint!,
        ));
      } else {
        emit(state.copyWith(
          status: PointStatus.error,
          errorMessage: "Failed Data Extraction",
        ));
      }
    });
  }
}

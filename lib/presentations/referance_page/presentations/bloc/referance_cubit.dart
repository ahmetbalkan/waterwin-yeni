import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/referance_page/domain/model/referal_response_model.dart';
import 'package:waterwin_app/presentations/referance_page/domain/repository/referance_remote_repository.dart';

part 'referance_state.dart';
part 'referance_cubit.freezed.dart';

class ReferanceCubit extends Cubit<ReferanceState> {
  ReferanceCubit({
    ReferanceRemoteRepository? referanceRemoteRepository,
  }) : super(ReferanceState.initial()) {
    _referanseRemoteRepository =
        referanceRemoteRepository ?? getIt<ReferanceRemoteRepository>();
  }

  late final ReferanceRemoteRepository _referanseRemoteRepository;

  getReranceAndCode() async {
    emit(state.copyWith(status: ReferanceStatus.loading));
    final result = await _referanseRemoteRepository.getReferalsAndCodes();

    result.fold((error) {
      emit(state.copyWith(
        status: ReferanceStatus.error,
        message: error.message,
      ));
    }, (response) {
      if (response.data != null) {
        emit(state.copyWith(
          status: ReferanceStatus.loaded,
          referanceCode: response.data!.userReferralCode!,
          referances: response.data!.referrals,
        ));
      } else {
        emit(state.copyWith(
          status: ReferanceStatus.error,
          message: "Failed Data Extraction",
        ));
      }
    });
  }
}

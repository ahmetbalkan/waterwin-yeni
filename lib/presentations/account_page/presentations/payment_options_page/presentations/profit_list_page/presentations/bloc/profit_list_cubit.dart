import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/profit_statistic_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/repository/profit_repository.dart';

part 'profit_list_state.dart';
part 'profit_list_cubit.freezed.dart';

class ProfitListCubit extends Cubit<ProfitListState> {
  ProfitListCubit({
    ProfitRepository? profitRepository,
  }) : super(ProfitListState.initial()) {
    _profitRepository = profitRepository ?? getIt<ProfitRepository>();
  }

  late final ProfitRepository _profitRepository;

  /// Refresh profit statistics
  refreshProfitStatistics() async {
    emit(state.copyWith(
      statisticsStatus: ProfitListStatus.loading,
      errorMessage: null,
    ));

    final result = await _profitRepository.fetchAndRefreshProfitStatistics();
    result.fold(
      (exception) {
        emit(state.copyWith(
          statisticsStatus: ProfitListStatus.error,
          errorMessage: exception.message,
        ));
      },
      (profitStatistics) {
        emit(state.copyWith(
          statisticsStatus: ProfitListStatus.loaded,
          profitStatistics: profitStatistics,
        ));
      },
    );
  }
}

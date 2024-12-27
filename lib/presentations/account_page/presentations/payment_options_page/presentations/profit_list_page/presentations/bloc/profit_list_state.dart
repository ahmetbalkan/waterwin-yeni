part of 'profit_list_cubit.dart';

enum ProfitListStatus { initial, loading, loaded, error }

@freezed
class ProfitListState with _$ProfitListState {
  const factory ProfitListState({
    @Default(ProfitListStatus.initial) ProfitListStatus statisticsStatus,
    List<ProfitStatisticModel>? profitStatistics,
    String? errorMessage,
  }) = _ProfitListState;

  factory ProfitListState.initial() => const ProfitListState();
}

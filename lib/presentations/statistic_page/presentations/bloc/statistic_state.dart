part of 'statistic_cubit.dart';

enum StatisticStatus { initial, loading, loaded, error }

enum TabStatus { all, weekly, monthly }

@freezed
class StatisticState with _$StatisticState {
  const factory StatisticState({
    required StatisticStatus status,
    required TabStatus tabStatus,
    required String message,
    required int dailyGoal,
    required List<BottleModel> bottles,
    required List<WaterIntakeModel> dailyWaterIntakeData,
  }) = _StatisticState;

  factory StatisticState.initial() => const StatisticState(
        status: StatisticStatus.initial,
        tabStatus: TabStatus.all,
        message: '',
        dailyGoal: 2000,
        bottles: [],
        dailyWaterIntakeData: [],
      );
}

part of 'history_cubit.dart';

enum HistoryStatus { initial, loading, loaded, error }

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    required HistoryStatus status,
    required List<PointResponseModel> points,
    required int page,
    required int limit,
    required List<DayProgressModel> dates,
    required int selectedIndex,
    required bool isLoading,
  }) = _HistoryState;

  factory HistoryState.initial() => const HistoryState(
        status: HistoryStatus.initial,
        points: [],
        limit: 20,
        page: 1,
        dates: [],
        selectedIndex: 0,
        isLoading: false,
      );
}

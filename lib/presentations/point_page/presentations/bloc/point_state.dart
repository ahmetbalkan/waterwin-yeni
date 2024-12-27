part of 'point_cubit.dart';

enum PointStatus { initial, loading, loaded, error }

@freezed
class PointState with _$PointState {
  const factory PointState({
    required PointStatus status,
    required int gainedPoints,
    required int referancePoints,
    required int totalPoints,
    required String errorMessage,
    required bool isButtonEnabled,
  }) = _PointState;

  factory PointState.initial() => const PointState(
        status: PointStatus.initial,
        gainedPoints: 0,
        referancePoints: 0,
        errorMessage: '',
        totalPoints: 0,
        isButtonEnabled: true,
      );
}

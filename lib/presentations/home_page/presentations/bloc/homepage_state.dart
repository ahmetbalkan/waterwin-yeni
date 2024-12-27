part of 'homepage_cubit.dart';

enum HomepageStatus { initial, loading, loaded, error }

@freezed
class HomepageState with _$HomepageState {
  const factory HomepageState({
    required HomepageStatus status,
    required bool isButtonEnabled,
    required int remainingSeconds,
    required List<PointResponseModel> points,
    required int totalPoints,
    required int totalDays,
    required BottleModel bottle,
  }) = _HomepageState;

  factory HomepageState.initial() => HomepageState(
        isButtonEnabled: false,
        remainingSeconds: 0,
        status: HomepageStatus.initial,
        points: [],
        totalPoints: 0,
        totalDays: 0,
        bottle: BottleModel(
          id: 1,
          svgAsset: TAssetsConstants.logoBlue,
          name: "25 mL",
          ml: 25,
        ),
      );
}

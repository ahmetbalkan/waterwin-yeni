import 'package:freezed_annotation/freezed_annotation.dart';

part 'information_state.freezed.dart';

@freezed
class InformationState with _$InformationState {
  const factory InformationState({
    @Default('') String name,
    @Default(1) int currentPage,
    @Default(0) int gender,
    @Default(160) int height,
    @Default(70) int weight,
    @Default(20) int age,
    @Default('07:00:00') String wakeUpTime,
    @Default('23:00:00') String sleepTime,
    @Default(0) int activityLevel,
    @Default(0) int weather,
    @Default(0.0) double waterIntake,
    @Default('') String phoneNumber,
    @Default('') String errorMessage,
    @Default(InformationStatus.loaded()) InformationStatus status,
  }) = _InformationState;
}

@freezed
class InformationStatus with _$InformationStatus {
  const factory InformationStatus.loading() = _Loading;
  const factory InformationStatus.loaded() = _Loaded;
  const factory InformationStatus.calculationFinished() = _CalculationFinished;
  const factory InformationStatus.addInformationComplete() =
      _AddInformationComplete;
  const factory InformationStatus.updateComplete() = _UpdateComplete;
  const factory InformationStatus.error() = _Error;
}

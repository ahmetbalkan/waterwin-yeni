part of 'splash_cubit.dart';

enum SplashStatus { initial, loading, success, failure, gotoinformation }

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    required SplashStatus status,
    String? errorMessage,
  }) = _SplashState;

  factory SplashState.initial() => const SplashState(
        status: SplashStatus.initial,
        errorMessage: "",
      );
}

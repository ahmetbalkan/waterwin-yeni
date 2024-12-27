part of 'onboarding_cubit.dart';

enum HistoryStatus { initial, loading, loaded, error }

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({required int page}) = _OnboardingState;

  factory OnboardingState.initial() => const OnboardingState(
        page: 0,
      );
}

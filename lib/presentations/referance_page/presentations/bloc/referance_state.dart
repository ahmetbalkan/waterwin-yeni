part of 'referance_cubit.dart';

enum ReferanceStatus { initial, loading, loaded, error }

@freezed
class ReferanceState with _$ReferanceState {
  const factory ReferanceState({
    required ReferanceStatus status,
    required List<ReferralResponseModel> referances,
    required String referanceCode,
    required String message,
  }) = _ReferanceState;

  factory ReferanceState.initial() => const ReferanceState(
        status: ReferanceStatus.initial,
        referances: [],
        referanceCode: '',
        message: '',
      );
}

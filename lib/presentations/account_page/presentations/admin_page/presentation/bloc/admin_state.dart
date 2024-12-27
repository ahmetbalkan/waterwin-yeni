part of 'admin_cubit.dart';

@freezed
class AdminState with _$AdminState {
  const factory AdminState({
    required AdminStatus status,
    required bool isLoading,
    String? message,
    ReferanceAdminUserInfoModel? referenceUserInfo,
    @Default([]) List<ReferanceAdminModel> referenceList,
    @Default([]) List<ReferanceAdminPaymentModel> paymentRequests,
  }) = _AdminState;

  factory AdminState.initial() => const AdminState(
        status: AdminStatus.initial,
        isLoading: false,
        message: null,
        referenceUserInfo: null,
        referenceList: [],
        paymentRequests: [],
      );
}

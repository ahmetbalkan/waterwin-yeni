part of 'forgotpassword_cubit.dart';

enum ForgotPasswordStatus {
  initial,
  loading,
  emailSent,
  passwordChanged,
  tokenValidated, // Yeni durum
  error
}

enum OtpResendStatus {
  initial,
  loading,
  error,
  emailSent,
}

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    required ForgotPasswordStatus status,
    required OtpResendStatus otpResendStatus,
    required String errorMessage,
    required int timerValue,
    required bool isResendButtonActive,
    required String email,
  }) = _ForgotPasswordState;

  factory ForgotPasswordState.initial() => const ForgotPasswordState(
        status: ForgotPasswordStatus.initial,
        otpResendStatus: OtpResendStatus.initial,
        errorMessage: '',
        timerValue: 60,
        isResendButtonActive: false,
        email: '',
      );
}

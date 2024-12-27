part of 'change_password_cubit.dart';

enum ChangePasswordStatus { initial, loading, success, error }

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    required ChangePasswordStatus status,
    required bool oldPasswordObscure,
    required bool new1PasswordObscure,
    required bool new2PasswordObscure,
    required String errorMessage,
  }) = _ChangePasswordState;

  factory ChangePasswordState.initial() => const ChangePasswordState(
        status: ChangePasswordStatus.initial,
        oldPasswordObscure: true,
        new1PasswordObscure: true,
        new2PasswordObscure: true,
        errorMessage: '',
      );
}

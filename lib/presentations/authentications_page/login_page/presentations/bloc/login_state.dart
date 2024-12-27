part of 'login_cubit.dart';

enum LoginStatus { initial, loading, loaded, error, gotoinformation, logout }

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required LoginStatus status,
    required String errorMessage,
    required bool isObscure,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
        status: LoginStatus.initial,
        errorMessage: '',
        isObscure: true,
      );
}

part of 'register_cubit.dart';

enum RegisterStatus { initial, loading, registered, error }

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    required RegisterStatus status,
    required String errorMessage,
    required bool isObscure,
    required bool isObscureConfirm,
    required bool termConfirm,
  }) = _RegisterState;

  factory RegisterState.initial() => const RegisterState(
        status: RegisterStatus.initial,
        errorMessage: '',
        isObscure: true,
        isObscureConfirm: true,
        termConfirm: false,
      );
}

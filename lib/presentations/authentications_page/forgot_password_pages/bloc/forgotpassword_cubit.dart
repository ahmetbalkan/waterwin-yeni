import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/authentications_page/forgot_password_pages/domain/repository/remote/forgotpassword_remote_repository.dart';

part 'forgotpassword_state.dart';
part 'forgotpassword_cubit.freezed.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({
    ForgotpasswordRemoteRepository? forgotpasswordRemoteRepository,
  }) : super(ForgotPasswordState.initial()) {
    _forgotpasswordRemoteRepository = forgotpasswordRemoteRepository ??
        getIt<ForgotpasswordRemoteRepository>();
  }

  late final ForgotpasswordRemoteRepository _forgotpasswordRemoteRepository;
  Timer? _timer;

  void startCountdown() {
    emit(state.copyWith(timerValue: 60, isResendButtonActive: false));
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timerValue > 1) {
        emit(state.copyWith(timerValue: state.timerValue - 1));
      } else {
        emit(state.copyWith(isResendButtonActive: true));
        _timer?.cancel();
      }
    });
  }

  // Şifre sıfırlama işlemi
  Future<void> forgotPassword(String email) async {
    emit(state.copyWith(
      status: ForgotPasswordStatus.loading,
    ));
    final result = await _forgotpasswordRemoteRepository.forgotPassword(email);
    result.fold(
      (error) {
        emit(state.copyWith(
          status: ForgotPasswordStatus.error,
          errorMessage: error.message,
        ));
      },
      (response) {
        emit(state.copyWith(
          status: ForgotPasswordStatus.emailSent,
          email: email,
        ));
        emit(state.copyWith(
          status: ForgotPasswordStatus.initial,
        ));
      },
    );
  }

  // Şifre sıfırlama işlemi
  Future<void> reSendForgotPassword() async {
    emit(state.copyWith(
      otpResendStatus: OtpResendStatus.loading,
    ));
    final result =
        await _forgotpasswordRemoteRepository.forgotPassword(state.email);
    result.fold(
      (error) {
        emit(state.copyWith(
          otpResendStatus: OtpResendStatus.error,
          errorMessage: error.message,
        ));
      },
      (response) {
        emit(state.copyWith(
          otpResendStatus: OtpResendStatus.emailSent,
        ));
        startCountdown();
        emit(state.copyWith(
          otpResendStatus: OtpResendStatus.initial,
        ));
      },
    );
  }

  // Reset token doğrulama
  Future<void> validateResetToken(String email, String token) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));
    final result =
        await _forgotpasswordRemoteRepository.validateResetToken(email, token);
    result.fold(
      (error) {
        emit(state.copyWith(
          status: ForgotPasswordStatus.error,
          errorMessage: error.message,
        ));
      },
      (response) {
        if (response.success) {
          emit(state.copyWith(
            status: ForgotPasswordStatus.tokenValidated,
          ));
        } else {
          emit(state.copyWith(
            status: ForgotPasswordStatus.error,
            errorMessage: response.message,
          ));
        }
      },
    );
  }

  // Şifre değiştirme
  Future<void> changePassword(
    String email,
    String password,
    String token,
    String passwordConfirmation,
  ) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));
    final result = await _forgotpasswordRemoteRepository.resetpassword(
      email,
      password,
      passwordConfirmation,
      token,
    );
    result.fold(
      (error) {
        emit(state.copyWith(
          status: ForgotPasswordStatus.error,
          errorMessage: error.message,
        ));
      },
      (response) {
        emit(state.copyWith(
          status: ForgotPasswordStatus.passwordChanged,
        ));
      },
    );
  }

  // Timer'ı iptal et ve kaynakları temizle
  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

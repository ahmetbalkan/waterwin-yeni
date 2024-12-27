import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/authentications_page/register_page/domain/repository/register_remote_repository.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    RegisterRepository? registerRepository,
  }) : super(RegisterState.initial()) {
    _registerRepository = registerRepository ?? getIt<RegisterRepository>();
  }

  late final RegisterRepository _registerRepository;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: RegisterStatus.loading));

    final result = await _registerRepository.register(
      email: email,
      password: password,
    );

    result.fold((error) {
      emit(state.copyWith(
        status: RegisterStatus.error,
        errorMessage: error.message,
      ));
    }, (response) {
      if (response.success) {
        emit(state.copyWith(
          status: RegisterStatus.registered,
        ));
      } else {
        emit(state.copyWith(
          status: RegisterStatus.error,
          errorMessage: response.message,
        ));
      }
    });
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  void toggleRePasswordVisibility() {
    emit(state.copyWith(isObscureConfirm: !state.isObscureConfirm));
  }

  void toggleTermConfirm() {
    emit(state.copyWith(termConfirm: !state.termConfirm));
  }
}

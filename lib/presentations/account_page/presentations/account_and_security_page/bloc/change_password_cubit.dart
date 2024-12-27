import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/account_page/domain/dto/change_password_dto.dart';
import 'package:waterwin_app/presentations/account_page/domain/repository/change_password_repository.dart';

part 'change_password_state.dart';
part 'change_password_cubit.freezed.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({
    ChangePasswordRepository? changePasswordRepository,
  }) : super(ChangePasswordState.initial()) {
    _changePasswordRepository =
        changePasswordRepository ?? getIt<ChangePasswordRepository>();
  }

  late final ChangePasswordRepository _changePasswordRepository;

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    emit(state.copyWith(status: ChangePasswordStatus.loading));

    final changePasswordDto = ChangePasswordDto(
      oldPassword: oldPassword,
      newPassword: newPassword,
      newPasswordConfirmation: newPasswordConfirmation,
    );

    final result = await _changePasswordRepository.changePassword(
      changePasswordDto: changePasswordDto,
    );

    result.fold(
      (error) {
        emit(state.copyWith(
          status: ChangePasswordStatus.error,
          errorMessage: error.message,
        ));
      },
      (response) {
        emit(state.copyWith(
          status: ChangePasswordStatus.success,
        ));
      },
    );
  }

  void togglePasswordVisibility(String type) {
    switch (type) {
      case "old":
        emit(state.copyWith(oldPasswordObscure: !state.oldPasswordObscure));
        break;
      case "new1":
        emit(state.copyWith(new1PasswordObscure: !state.new1PasswordObscure));
        break;
      case "new2":
        emit(state.copyWith(new2PasswordObscure: !state.new2PasswordObscure));
        break;
      default:
    }
  }
}

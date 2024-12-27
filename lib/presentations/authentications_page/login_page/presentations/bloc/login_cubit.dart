import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/account_page/domain/repository/profit_repository.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/auth_local_repository.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/remote/login_remote_repository.dart';
import 'package:waterwin_app/presentations/information_page/domain/repository/local/information_local_repository.dart';
import 'package:waterwin_app/presentations/point_page/domain/repository/local/point_local_repository.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    LoginRepository? loginRepository,
    AuthLocalRepository? loginLocalRepository,
    PointLocalRepository? pointLocalRepository,
    ProfitRepository? profitRepository,
    InformationLocalRepository? informationRepository,
  }) : super(LoginState.initial()) {
    _loginRepository = loginRepository ?? getIt<LoginRepository>();
    _loginLocalRepository =
        loginLocalRepository ?? getIt<AuthLocalRepository>();
    _informationRepository =
        informationRepository ?? getIt<InformationLocalRepository>();
    _pointLocalRepository =
        pointLocalRepository ?? getIt<PointLocalRepository>();
    _profitRepository = profitRepository ?? getIt<ProfitRepository>();
  }

  late final LoginRepository _loginRepository;
  late final AuthLocalRepository _loginLocalRepository;
  late final InformationLocalRepository _informationRepository;
  late final PointLocalRepository _pointLocalRepository;
  late final ProfitRepository _profitRepository;

  Future<void> getLogin({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: LoginStatus.loading));
    final result = await _loginRepository.login(
      email: email,
      password: password,
    );

    result.fold((error) {
      emit(state.copyWith(
        status: LoginStatus.error,
        errorMessage: error.message,
      ));
    }, (response) {
      if (response.data?.information == null) {
        emit(state.copyWith(
          status: LoginStatus.gotoinformation,
        ));
      } else {
        emit(state.copyWith(
          status: LoginStatus.loaded,
        ));
      }
    });
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  void logout() async {
    await _loginLocalRepository.clearAuthData();
    await _informationRepository.clearInformationData();
    await _pointLocalRepository.clearAllPoints();
    await _profitRepository.clearProfitData();

    emit(state.copyWith(status: LoginStatus.logout));
  }
}

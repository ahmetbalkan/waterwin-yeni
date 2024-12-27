import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/core/network/app_exception.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/model/auth_response_model.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/login_local_repository.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/remote/auth_remote_repository.dart';
import 'package:waterwin_app/presentations/information_page/domain/repository/local/information_local_repository.dart';
part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    LoginLocalRepository? loginLocalRepository,
    AuthRepository? authRepository,
    InformationLocalRepository? informationLocalRepository,
  })  : _loginLocalRepository =
            loginLocalRepository ?? getIt<LoginLocalRepository>(),
        _authRepository = authRepository ?? getIt<AuthRepository>(),
        _informationLocalRepository =
            informationLocalRepository ?? getIt<InformationLocalRepository>(),
        super(SplashState.initial());

  final LoginLocalRepository _loginLocalRepository;
  final AuthRepository _authRepository;
  final InformationLocalRepository _informationLocalRepository;

  Future<void> checkAndRefreshToken() async {
    emit(state.copyWith(status: SplashStatus.loading));

    try {
      // 1. Yerel token ve refresh token kontrolü
      final token = await _loginLocalRepository.getToken();
      log('$token');
      final refreshToken = await _loginLocalRepository.getRefreshToken();

      if (token == null || refreshToken == null) {
        emit(state.copyWith(status: SplashStatus.failure));
        return;
      }

      // 2. Refresh token ile API çağrısı yaparak token yenileme işlemi
      final Either<AppException, ApiResponse<AuthResponseModel>> result =
          await _authRepository.refreshAuthToken();

      result.fold(
        (failure) {
          // Başarısız ise veriyi temizle ve failure durumunu yayınla
          _loginLocalRepository.clearAuthData();
          emit(state.copyWith(status: SplashStatus.failure));
        },
        (successResponse) async {
          // Başarılı durumda yeni tokenları güncelle
          final refreshTokenData = successResponse.data;
          if (refreshTokenData != null) {
            await _loginLocalRepository.updateToken(
              refreshTokenData.token!,
              refreshTokenData.refreshToken!,
            );

            if (successResponse.data?.information != null) {
              _informationLocalRepository
                  .insertInformation(successResponse.data!.information!);
              emit(state.copyWith(status: SplashStatus.success));
            } else {
              emit(state.copyWith(status: SplashStatus.gotoinformation));
            }
          } else {
            _loginLocalRepository.clearAuthData();
            emit(state.copyWith(status: SplashStatus.failure));
          }
        },
      );
    } catch (e) {
      // Beklenmeyen bir hata oluşursa failure durumunu yay
      await _loginLocalRepository.clearAuthData();
      emit(state.copyWith(status: SplashStatus.failure));
    }
  }
}

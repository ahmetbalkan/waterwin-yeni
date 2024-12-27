import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/account_page/presentations/admin_page/domain/model/referance_admin_model.dart';
import 'package:waterwin_app/presentations/account_page/presentations/admin_page/domain/repositories/remote/admin_remote_repository.dart';

part 'admin_state.dart';
part 'admin_cubit.freezed.dart';

enum AdminStatus { initial, loading, loaded, error }

class AdminCubit extends Cubit<AdminState> {
  AdminCubit({AdminRemoteRepository? adminRemoteRepository})
      : _adminRemoteRepository =
            adminRemoteRepository ?? getIt<AdminRemoteRepository>(),
        super(AdminState.initial());

  final AdminRemoteRepository _adminRemoteRepository;

  Future<void> addPoints(int count) async {
    emit(state.copyWith(status: AdminStatus.loading, isLoading: true));
    final result = await _adminRemoteRepository.addPoints(10);
    result.fold(
      (error) => emit(state.copyWith(
          status: AdminStatus.error,
          isLoading: false,
          message: error.toString())),
      (apiResponse) => emit(state.copyWith(
          status: AdminStatus.loaded,
          isLoading: false,
          message: apiResponse.message)),
    );
  }

  Future<void> deletePointsByUserId() async {
    emit(state.copyWith(status: AdminStatus.loading, isLoading: true));
    final result = await _adminRemoteRepository.deletePointsByUserId();
    result.fold(
      (error) => emit(state.copyWith(
          status: AdminStatus.error,
          isLoading: false,
          message: error.toString())),
      (apiResponse) => emit(state.copyWith(
          status: AdminStatus.loaded,
          isLoading: false,
          message: apiResponse.message)),
    );
  }

  Future<void> deletePaymentRequest(int paymentRequestId) async {
    emit(state.copyWith(status: AdminStatus.loading, isLoading: true));
    final result =
        await _adminRemoteRepository.deletePaymentRequest(paymentRequestId);
    result.fold(
      (error) => emit(state.copyWith(
          status: AdminStatus.error,
          isLoading: false,
          message: error.toString())),
      (apiResponse) => emit(state.copyWith(
          status: AdminStatus.loaded,
          isLoading: false,
          message: apiResponse.message)),
    );
  }

  Future<void> addReference() async {
    emit(state.copyWith(status: AdminStatus.loading, isLoading: true));
    final result = await _adminRemoteRepository.addReference();
    result.fold(
      (error) => emit(state.copyWith(
          status: AdminStatus.error,
          isLoading: false,
          message: error.toString())),
      (apiResponse) {
        final userInfo = _adminRemoteRepository.parseUserInfo(apiResponse);
        emit(state.copyWith(
          status: AdminStatus.loaded,
          isLoading: false,
          message: apiResponse.message,
          referenceUserInfo: userInfo,
        ));
      },
    );
  }

  Future<void> addReferancePoints(int refUserId, int count) async {
    emit(state.copyWith(status: AdminStatus.loading, isLoading: true));
    final result =
        await _adminRemoteRepository.addReferancePoints(refUserId, 10);
    result.fold(
      (error) => emit(state.copyWith(
          status: AdminStatus.error,
          isLoading: false,
          message: error.toString())),
      (apiResponse) => emit(state.copyWith(
          status: AdminStatus.loaded,
          isLoading: false,
          message: apiResponse.message)),
    );
  }

  Future<void> deleteReference(int refUserId) async {
    emit(state.copyWith(status: AdminStatus.loading, isLoading: true));
    final result = await _adminRemoteRepository.deleteReference(refUserId);
    result.fold(
      (error) => emit(state.copyWith(
          status: AdminStatus.error,
          isLoading: false,
          message: error.toString())),
      (apiResponse) => emit(state.copyWith(
          status: AdminStatus.loaded,
          isLoading: false,
          message: apiResponse.message)),
    );
  }

  Future<void> getReferences() async {
    emit(state.copyWith(status: AdminStatus.loading, isLoading: true));
    final result = await _adminRemoteRepository.getReferences();
    result.fold(
      (error) => emit(state.copyWith(
          status: AdminStatus.error,
          isLoading: false,
          message: error.toString())),
      (apiResponse) {
        final references = _adminRemoteRepository.parseReferences(apiResponse);
        emit(state.copyWith(
          status: AdminStatus.loaded,
          isLoading: false,
          message: apiResponse.message,
          referenceList: references,
        ));
      },
    );
  }

  Future<void> getPaymentRequests() async {
    emit(state.copyWith(status: AdminStatus.loading, isLoading: true));
    final result = await _adminRemoteRepository.getPaymentRequests();
    result.fold(
      (error) => emit(state.copyWith(
          status: AdminStatus.error,
          isLoading: false,
          message: error.toString())),
      (apiResponse) {
        final payments =
            _adminRemoteRepository.parsePaymentRequests(apiResponse);
        emit(state.copyWith(
          status: AdminStatus.loaded,
          isLoading: false,
          message: apiResponse.message,
          paymentRequests: payments,
        ));
      },
    );
  }

  // Yeni eklenen silme metodları:
  Future<void> deleteUserAndReferencePoints() async {
    emit(state.copyWith(status: AdminStatus.loading, isLoading: true));
    final result = await _adminRemoteRepository.deleteUserAndReferencePoints();
    result.fold(
      (error) => emit(state.copyWith(
        status: AdminStatus.error,
        isLoading: false,
        message: error.toString(),
      )),
      (apiResponse) => emit(state.copyWith(
        status: AdminStatus.loaded,
        isLoading: false,
        message: apiResponse.message,
      )),
    );
  }

  Future<void> deleteOnlyReferencePoints() async {
    emit(state.copyWith(status: AdminStatus.loading, isLoading: true));
    final result = await _adminRemoteRepository.deleteOnlyReferencePoints();
    result.fold(
      (error) => emit(state.copyWith(
        status: AdminStatus.error,
        isLoading: false,
        message: error.toString(),
      )),
      (apiResponse) => emit(state.copyWith(
        status: AdminStatus.loaded,
        isLoading: false,
        message: apiResponse.message,
      )),
    );
  }
}

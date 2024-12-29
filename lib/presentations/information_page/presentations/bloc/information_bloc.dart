import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterwin_app/core/firebase_init.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/information_page/data/data_source/dtos/calculate_dto.dart';
import 'package:waterwin_app/presentations/information_page/data/data_source/dtos/information_dto.dart';
import 'package:waterwin_app/presentations/information_page/domain/repository/local/information_local_repository.dart';
import 'package:waterwin_app/presentations/information_page/domain/repository/remote/information_remote_repository.dart';
import 'information_state.dart';

class InformationBloc extends Cubit<InformationState> {
  InformationBloc({
    InformationRemoteRepository? informationRepository,
    InformationLocalRepository? informationLocalRepository,
    FirebaseApi? firebaseApi,
  }) : super(const InformationState()) {
    _informationRepository =
        informationRepository ?? getIt<InformationRemoteRepository>();
    _informationLocalRepository =
        informationLocalRepository ?? getIt<InformationLocalRepository>();
    _firebaseApi = firebaseApi ?? getIt<FirebaseApi>();
  }

  late final InformationRemoteRepository _informationRepository;
  late final InformationLocalRepository _informationLocalRepository;
  late final FirebaseApi _firebaseApi;

  // Sayfa ilerleme ve geri gitme işlemleri
  Future<void> changePage(int newPage) async {
    emit(state.copyWith(currentPage: newPage));
  }

  Future<void> getInformation() async {
    emit(state.copyWith(status: const InformationStatus.loading()));

    final information = await _informationLocalRepository.getFirstInformation();

    if (information != null) {
      emit(state.copyWith(
        status: const InformationStatus.loaded(),
        name: information.name ?? '',
        gender: information.gender ?? 0,
        height: information.height ?? 160,
        weight: information.weight ?? 70,
        age: information.age ?? 20,
        wakeUpTime: information.wakeUpTime ?? '07:00',
        sleepTime: information.sleepTime ?? '23:00',
        activityLevel: information.activityLevel ?? 0,
        weather: information.weatherCondition ?? 0,
        phoneNumber: information.phoneNumber ?? '',
      ));
    } else {
      emit(state.copyWith(
        status: const InformationStatus.error(),
        errorMessage: 'Information not found',
      ));
    }
  }

  Future<void> addInformation() async {
    emit(state.copyWith(status: const InformationStatus.loading()));

    var fcmtoken = await _firebaseApi.getFCMToken();

    final information = InformationDto(
      name: state.name,
      gender: state.gender,
      height: state.height,
      weight: state.weight,
      age: state.age,
      sleepTime: state.sleepTime,
      wakeUpTime: state.wakeUpTime,
      activityLevel: state.activityLevel,
      weatherCondition: state.weather,
      phoneNumber: state.phoneNumber,
      fcmtoken: fcmtoken,
    );

    log(information.toJson().toString());

    final result = await _informationRepository.addInformation(information);

    result.fold(
      (error) {
        emit(state.copyWith(
          status: const InformationStatus.error(),
          errorMessage: error.message,
        ));
      },
      (response) async {
        log(response.data.toString());
        if (response.success) {
          await _informationLocalRepository.insertInformation(response.data!);
          emit(state.copyWith(
            activityLevel: response.data?.activityLevel ?? state.activityLevel,
            age: response.data?.age ?? state.age,
            gender: response.data?.gender ?? state.gender,
            height: response.data?.height ?? state.height,
            name: response.data?.name ?? state.name,
            weather: response.data?.weatherCondition ?? state.weather,
            phoneNumber: response.data?.phoneNumber ?? state.phoneNumber,
            sleepTime: response.data?.sleepTime ?? state.sleepTime,
            wakeUpTime: response.data?.wakeUpTime ?? state.wakeUpTime,
            weight: response.data?.weight ?? state.weight,
            waterIntake:
                response.data?.dailyGoal?.toDouble() ?? state.waterIntake,
            errorMessage: "",
            status: const InformationStatus.addInformationComplete(),
          ));
        } else {
          emit(state.copyWith(
            status: const InformationStatus.error(),
            errorMessage: response.message,
          ));
        }
      },
    );
  }

  Future<void> calculateDailyGoal() async {
    emit(state.copyWith(status: const InformationStatus.loading()));

    final calculateInfoDto = CalculateInfoDto(
      height: state.height,
      weight: state.weight,
      age: state.age,
      sleepTime: state.sleepTime,
      wakeUpTime: state.wakeUpTime,
      activityLevel: state.activityLevel,
      weatherCondition: state.weather,
    );

    log(calculateInfoDto.toJson().toString());

    final result =
        await _informationRepository.calculateDailyGoal(calculateInfoDto);

    result.fold(
      (error) {
        emit(state.copyWith(
          status: const InformationStatus.error(),
          errorMessage: error.message,
        ));
      },
      (response) async {
        emit(state.copyWith(
          waterIntake: response.data?.toDouble() ?? state.waterIntake,
          errorMessage: "",
          status: const InformationStatus.calculationFinished(),
        ));
      },
    );
  }

  Future<void> updateInformation(Map<String, Object> value) async {
    emit(state.copyWith(status: const InformationStatus.loading()));

    final result = await _informationRepository.updateInformation(value);

    result.fold(
      (error) {
        emit(state.copyWith(
          status: const InformationStatus.error(),
          errorMessage: error.message,
        ));
        log("Error updating information: ${error.message}");
      },
      (response) async {
        // Güncel veriyi state ile güncelle
        emit(state.copyWith(
          name: response.data?.name ?? state.name,
          gender: response.data?.gender ?? state.gender,
          height: response.data?.height ?? state.height,
          weight: response.data?.weight ?? state.weight,
          age: response.data?.age ?? state.age,
          waterIntake:
              response.data?.dailyGoal?.toDouble() ?? state.waterIntake,
          wakeUpTime: response.data?.wakeUpTime ?? state.wakeUpTime,
          sleepTime: response.data?.sleepTime ?? state.sleepTime,
          activityLevel: response.data?.activityLevel ?? state.activityLevel,
          weather: response.data?.weatherCondition ?? state.weather,
          phoneNumber: response.data?.phoneNumber ?? state.phoneNumber,
          status: const InformationStatus.updateComplete(), // Geçici bir durum
        ));

        log("Information updated locally and status reset: ${state.toString()}");
      },
    );
  }

  void updateField({required String fieldName, required dynamic newValue}) {
    switch (fieldName) {
      case 'name':
        emit(state.copyWith(name: newValue));
        break;
      case 'gender':
        emit(state.copyWith(gender: newValue));
        break;
      case 'height':
        emit(state.copyWith(height: newValue));
        break;
      case 'weight':
        emit(state.copyWith(weight: newValue));
        break;
      case 'age':
        emit(state.copyWith(age: newValue));
        break;
      case 'wakeUpTime':
        emit(state.copyWith(wakeUpTime: newValue));
        break;
      case 'sleepTime':
        emit(state.copyWith(sleepTime: newValue));
        break;
      case 'activityLevel':
        emit(state.copyWith(activityLevel: newValue));
        break;
      case 'weather':
        emit(state.copyWith(weather: newValue));
        break;
      case 'phoneNumber':
        emit(state.copyWith(phoneNumber: newValue));
        break;
      default:
        debugPrint("Unknown field: $fieldName");
    }

    debugPrint("State updated: $fieldName = $newValue");
  }
}

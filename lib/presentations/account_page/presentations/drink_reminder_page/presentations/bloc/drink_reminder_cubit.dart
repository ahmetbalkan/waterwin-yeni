import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/account_page/domain/dto/reminder_dto.dart';
import 'package:waterwin_app/presentations/account_page/domain/repository/reminder_repository.dart';

part 'drink_reminder_state.dart';
part 'drink_reminder_cubit.freezed.dart';

class DrinkReminderCubit extends Cubit<DrinkReminderState> {
  DrinkReminderCubit({
    ReminderRepository? reminderRepository,
  }) : super(DrinkReminderState.initial()) {
    _reminderRepository = reminderRepository ?? getIt<ReminderRepository>();
  }

  late final ReminderRepository _reminderRepository;

  /// Hatırlatıcı verilerini almak
  Future<void> getReminderData() async {
    emit(state.copyWith(status: DrinkReminderStatus.loading));

    final result = await _reminderRepository.getReminderData();

    result.fold(
      (error) {
        emit(state.copyWith(
          status: DrinkReminderStatus.error,
          errorMessage: error.message,
        ));
        log("Error fetching reminder data: ${error.message}");
      },
      (apiResponse) {
        final reminder = apiResponse.data;
        emit(state.copyWith(
          status: DrinkReminderStatus.success,
          isReminderOn: reminder?.status ?? 0,
          reminderMessage: reminder?.reminderMessage ?? "",
          reminderInterval: reminder?.interval ?? 30,
          dayStart: stringToTimeOfDay(reminder?.dayStart ?? ""),
          dayEnd: stringToTimeOfDay(reminder?.dayEnd ?? ""),
        ));
        log("Reminder data loaded: ${state.toString()}");
      },
    );
  }

  /// Hatırlatıcı verilerini güncellemek
  Future<void> updateReminder() async {
    emit(state.copyWith(status: DrinkReminderStatus.loading));

    final reminderDto = ReminderDto(
      reminderStatus: state.isReminderOn,
      reminderMessage: state.reminderMessage,
      interval: state.reminderInterval,
      dayStart: timeOfDayToString(state.dayStart),
      dayEnd: timeOfDayToString(state.dayEnd),
    );

    final result =
        await _reminderRepository.updateReminder(reminderDto: reminderDto);

    result.fold(
      (error) {
        emit(state.copyWith(
          status: DrinkReminderStatus.error,
          errorMessage: error.message,
        ));
        log("Error updating reminder data: ${error.message}");
      },
      (apiResponse) {
        emit(state.copyWith(status: DrinkReminderStatus.saved));
        log("Reminder data updated successfully");
      },
    );
  }

  // Hatırlatıcıyı açma/kapama
  void toggleReminder(bool isOn) {
    emit(state.copyWith(
        isReminderOn: isOn == true ? 1 : 0,
        status: DrinkReminderStatus.success));
  }

  // Hatırlatıcı mesajını güncelleme
  void updateReminderMessage(String message) {
    emit(state.copyWith(
        reminderMessage: message, status: DrinkReminderStatus.success));
  }

  // Başlangıç saatini güncelleme
  void updateDayStart(TimeOfDay time) {
    emit(state.copyWith(dayStart: time, status: DrinkReminderStatus.success));
  }

  // Bitiş saatini güncelleme
  void updateDayEnd(TimeOfDay time) {
    emit(state.copyWith(dayEnd: time, status: DrinkReminderStatus.success));
  }

  // Aralığı güncelleme
  void updateInterval(int interval) {
    emit(state.copyWith(
        reminderInterval: interval, status: DrinkReminderStatus.success));
  }

  String timeOfDayToString(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  TimeOfDay stringToTimeOfDay(String timeString) {
    final parts = timeString.split(":");
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }
}

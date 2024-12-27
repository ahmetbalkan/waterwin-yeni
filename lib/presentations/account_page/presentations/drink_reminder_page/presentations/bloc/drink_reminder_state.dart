part of 'drink_reminder_cubit.dart';

enum DrinkReminderStatus { initial, loading, success, saved, error }

@freezed
class DrinkReminderState with _$DrinkReminderState {
  const factory DrinkReminderState({
    required DrinkReminderStatus status,
    required String errorMessage,
    required int isReminderOn,
    required String reminderMessage,
    required int reminderInterval,
    required TimeOfDay dayStart,
    required TimeOfDay dayEnd,
  }) = _DrinkReminderState;

  factory DrinkReminderState.initial() => const DrinkReminderState(
        status: DrinkReminderStatus.initial,
        errorMessage: '',
        isReminderOn: 0,
        reminderMessage: "Don't forget to drink your water.",
        reminderInterval: 30,
        dayStart: TimeOfDay(hour: 8, minute: 0),
        dayEnd: TimeOfDay(hour: 23, minute: 0),
      );
}

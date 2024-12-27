class ReminderDto {
  ReminderDto({
    required this.reminderStatus,
    required this.reminderMessage,
    required this.dayStart,
    required this.dayEnd,
    required this.interval,
  });

  final int? reminderStatus;
  final String? reminderMessage;
  final String? dayStart;
  final String? dayEnd;
  final int? interval;

  factory ReminderDto.fromJson(Map<String, dynamic> json) {
    return ReminderDto(
      reminderStatus: json["status"],
      reminderMessage: json["ReminderMessage"],
      dayStart: json["DayStart"],
      dayEnd: json["DayEnd"],
      interval: json["Interval"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": reminderStatus,
        "ReminderMessage": reminderMessage,
        "DayStart": dayStart,
        "DayEnd": dayEnd,
        "Interval": interval,
      };

  @override
  String toString() {
    return "$reminderStatus, $reminderMessage, $dayStart, $dayEnd, $interval, ";
  }
}

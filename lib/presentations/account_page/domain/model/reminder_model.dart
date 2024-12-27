class ReminderModel {
  ReminderModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.reminderMessage,
    required this.dayStart,
    required this.dayEnd,
    required this.interval,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? userId;
  final int? status;
  final String? reminderMessage;
  final String? dayStart;
  final String? dayEnd;
  final int? interval;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ReminderModel.fromJson(Map<String, dynamic> json) {
    return ReminderModel(
      id: json["id"],
      userId: json["user_id"],
      status: json["status"],
      reminderMessage: json["ReminderMessage"],
      dayStart: json["DayStart"],
      dayEnd: json["DayEnd"],
      interval: json["Interval"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "status": status,
        "ReminderMessage": reminderMessage,
        "DayStart": dayStart,
        "DayEnd": dayEnd,
        "Interval": interval,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return "$id, $userId, $status, $reminderMessage, $dayStart, $dayEnd, $interval, $createdAt, $updatedAt, ";
  }
}

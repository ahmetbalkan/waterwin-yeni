class ReferanceAdminUserInfoModel {
  final int userId;
  final String email;
  final int id;
  final String name;
  final String refId;
  final String? gender;
  final int height;
  final int weight;
  final int age;
  final String sleepTime;
  final String wakeUpTime;
  final String? activityLevel;
  final String? weatherCondition;
  final int dailyGoal;
  final String phoneNumber;
  final String createdAt;
  final String updatedAt;

  ReferanceAdminUserInfoModel({
    required this.userId,
    required this.email,
    required this.id,
    required this.name,
    required this.refId,
    this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.sleepTime,
    required this.wakeUpTime,
    this.activityLevel,
    this.weatherCondition,
    required this.dailyGoal,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReferanceAdminUserInfoModel.fromJson(Map<String, dynamic> json) {
    return ReferanceAdminUserInfoModel(
      userId: json['user_id'] as int,
      email: json['email'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      refId: json['ref_id'] as String,
      gender: json['gender'],
      height: json['height'] as int,
      weight: json['weight'] as int,
      age: json['age'] as int,
      sleepTime: json['sleep_time'] as String,
      wakeUpTime: json['wake_up_time'] as String,
      activityLevel: json['activity_level'],
      weatherCondition: json['weather_condition'],
      dailyGoal: json['daily_goal'] as int,
      phoneNumber: json['phone_number'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}

class ReferanceAdminDeletedModel {
  final int deletedReference;
  final int deletedPoints;

  ReferanceAdminDeletedModel({
    required this.deletedReference,
    required this.deletedPoints,
  });

  factory ReferanceAdminDeletedModel.fromJson(Map<String, dynamic> json) {
    return ReferanceAdminDeletedModel(
      deletedReference: json['deleted_reference'] as int,
      deletedPoints: json['deleted_points'] as int,
    );
  }
}

class ReferanceAdminModel {
  final int userId;
  final String email;
  final String name;
  final String refId;
  final String phoneNumber;

  ReferanceAdminModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.refId,
    required this.phoneNumber,
  });

  factory ReferanceAdminModel.fromJson(Map<String, dynamic> json) {
    return ReferanceAdminModel(
      userId: json['user_id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      refId: json['ref_id'] as String,
      phoneNumber: json['phone_number'] as String,
    );
  }
}

class ReferanceAdminPaymentModel {
  final int id;
  final int status;
  final String? payDate;
  final String? note;
  final String createdAt;

  ReferanceAdminPaymentModel({
    required this.id,
    required this.status,
    this.payDate,
    this.note,
    required this.createdAt,
  });

  factory ReferanceAdminPaymentModel.fromJson(Map<String, dynamic> json) {
    return ReferanceAdminPaymentModel(
      id: json['id'] as int,
      status: json['status'] as int,
      payDate: json['pay_date'] as String?,
      note: json['note'] as String?,
      createdAt: json['created_at'] as String,
    );
  }
}

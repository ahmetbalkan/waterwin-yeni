class ReferenceUserInfo {
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

  ReferenceUserInfo({
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

  factory ReferenceUserInfo.fromJson(Map<String, dynamic> json) {
    return ReferenceUserInfo(
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

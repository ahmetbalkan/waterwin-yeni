import 'package:floor/floor.dart';

@Entity(tableName: 'information')
class InformationModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? name;
  String? refId;
  int? userId;
  int? gender;
  int? height;
  int? weight;
  int? age;
  String? sleepTime;
  String? wakeUpTime;
  int? activityLevel;
  int? weatherCondition;
  int? dailyGoal;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  InformationModel({
    this.id,
    this.name,
    this.refId,
    this.userId,
    this.gender,
    this.height,
    this.weight,
    this.age,
    this.sleepTime,
    this.wakeUpTime,
    this.activityLevel,
    this.weatherCondition,
    this.dailyGoal,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  // JSON'dan Information'a çevirme
  InformationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    refId = json['ref_id'];
    userId = json['user_id'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    age = json['age'];
    sleepTime = json['sleep_time'];
    wakeUpTime = json['wake_up_time'];
    activityLevel = json['activity_level'];
    weatherCondition = json['weather_condition'];
    dailyGoal = json['daily_goal'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // Information'dan JSON'a çevirme
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['ref_id'] = refId;
    data['user_id'] = userId;
    data['gender'] = gender;
    data['height'] = height;
    data['weight'] = weight;
    data['age'] = age;
    data['sleep_time'] = sleepTime;
    data['wake_up_time'] = wakeUpTime;
    data['activity_level'] = activityLevel;
    data['weather_condition'] = weatherCondition;
    data['daily_goal'] = dailyGoal;
    data['phone_number'] = phoneNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  InformationModel copyWith({
    int? id,
    String? name,
    String? refId,
    int? userId,
    int? gender,
    int? height,
    int? weight,
    int? age,
    String? sleepTime,
    String? wakeUpTime,
    int? activityLevel,
    int? weatherCondition,
    int? dailyGoal,
    String? phoneNumber,
    String? createdAt,
    String? updatedAt,
  }) {
    return InformationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      refId: refId ?? this.refId,
      userId: userId ?? this.userId,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      sleepTime: sleepTime ?? this.sleepTime,
      wakeUpTime: wakeUpTime ?? this.wakeUpTime,
      activityLevel: activityLevel ?? this.activityLevel,
      weatherCondition: weatherCondition ?? this.weatherCondition,
      dailyGoal: dailyGoal ?? this.dailyGoal,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() =>
      'Information(id: $id, name: $name, refId: $refId, userId: $userId)';
}

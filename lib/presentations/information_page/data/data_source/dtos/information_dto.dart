class InformationDto {
  InformationDto({
    required this.name,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.sleepTime,
    required this.wakeUpTime,
    required this.activityLevel,
    required this.weatherCondition,
    required this.phoneNumber,
    required this.fcmtoken,
  });

  final String? name;
  final int? gender;
  final int? height;
  final int? weight;
  final int? age;
  final String? sleepTime;
  final String? wakeUpTime;
  final int? activityLevel;
  final int? weatherCondition;
  final String? fcmtoken;

  final String? phoneNumber;

  factory InformationDto.fromJson(Map<String, dynamic> json) {
    return InformationDto(
      name: json["name"],
      gender: json["gender"],
      height: json["height"],
      weight: json["weight"],
      age: json["age"],
      sleepTime: json["sleep_time"],
      wakeUpTime: json["wake_up_time"],
      activityLevel: json["activity_level"],
      weatherCondition: json["weather_condition"],
      phoneNumber: json["phone_number"],
      fcmtoken: json["fcmtoken"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "height": height,
        "weight": weight,
        "age": age,
        "sleep_time": sleepTime,
        "wake_up_time": wakeUpTime,
        "activity_level": activityLevel,
        "weather_condition": weatherCondition,
        "phone_number": phoneNumber,
        "fcmtoken": fcmtoken,
      };

  @override
  String toString() {
    return "$name, $gender, $height, $weight, $age, $sleepTime, $fcmtoken, $wakeUpTime, $activityLevel, $weatherCondition, $phoneNumber, ";
  }
}

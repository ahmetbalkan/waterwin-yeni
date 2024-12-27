class CalculateInfoDto {
  CalculateInfoDto({
    required this.weight,
    required this.height,
    required this.age,
    required this.wakeUpTime,
    required this.sleepTime,
    required this.activityLevel,
    required this.weatherCondition,
  });

  final int weight; // Nullable değil
  final int height;
  final int age;
  final String wakeUpTime;
  final String sleepTime;
  final int activityLevel;
  final int weatherCondition;

  CalculateInfoDto copyWith({
    int? weight,
    int? height,
    int? age,
    String? wakeUpTime,
    String? sleepTime,
    int? activityLevel,
    int? weatherCondition,
  }) {
    return CalculateInfoDto(
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
      wakeUpTime: wakeUpTime ?? this.wakeUpTime,
      sleepTime: sleepTime ?? this.sleepTime,
      activityLevel: activityLevel ?? this.activityLevel,
      weatherCondition: weatherCondition ?? this.weatherCondition,
    );
  }

  factory CalculateInfoDto.fromJson(Map<String, dynamic> json) {
    return CalculateInfoDto(
      weight: json["weight"] ?? 0, // Varsayılan değerler eklenebilir
      height: json["height"] ?? 0,
      age: json["age"] ?? 0,
      wakeUpTime: json["wake_up_time"] ?? "",
      sleepTime: json["sleep_time"] ?? "",
      activityLevel: json["activity_level"] ?? 1,
      weatherCondition: json["weather_condition"] ?? 1,
    );
  }

  Map<String, dynamic> toJson() => {
        "weight": weight,
        "height": height,
        "age": age,
        "wake_up_time": wakeUpTime,
        "sleep_time": sleepTime,
        "activity_level": activityLevel,
        "weather_condition": weatherCondition,
      };

  @override
  String toString() {
    return "$weight, $height, $age, $wakeUpTime, $sleepTime, $activityLevel, $weatherCondition, ";
  }
}

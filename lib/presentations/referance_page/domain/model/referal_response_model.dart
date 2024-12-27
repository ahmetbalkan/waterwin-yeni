class ReferralResponseModel {
  ReferralResponseModel({
    required this.userId,
    required this.points,
    required this.name,
  });

  final int? userId;
  final int? points;
  final String? name;

  factory ReferralResponseModel.fromJson(Map<String, dynamic> json) {
    return ReferralResponseModel(
      userId: json["user_id"],
      points: json["points"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "points": points,
        "name": name,
      };

  @override
  String toString() {
    return "$userId, $points, $name";
  }
}

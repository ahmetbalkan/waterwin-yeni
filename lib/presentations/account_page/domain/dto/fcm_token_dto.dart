class FCMTokenDto {
  FCMTokenDto({
    required this.token,
  });

  final String? token;

  factory FCMTokenDto.fromJson(Map<String, dynamic> json) {
    return FCMTokenDto(
      token: json["fcmtoken"],
    );
  }

  Map<String, dynamic> toJson() => {
        "fcmtoken": token,
      };

  @override
  String toString() {
    return "$token";
  }
}

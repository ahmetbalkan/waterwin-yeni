class RegisterResponseModel {
  RegisterResponseModel({
    required this.token,
    required this.refreshToken,
  });

  final String? token;
  final String? refreshToken;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      token: json["token"],
      refreshToken: json["refresh_token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "refresh_token": refreshToken,
      };

  @override
  String toString() {
    return "$token, $refreshToken";
  }
}

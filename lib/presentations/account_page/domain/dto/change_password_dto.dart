class ChangePasswordDto {
  ChangePasswordDto({
    required this.oldPassword,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });

  final String? oldPassword;
  final String? newPassword;
  final String? newPasswordConfirmation;

  factory ChangePasswordDto.fromJson(Map<String, dynamic> json) {
    return ChangePasswordDto(
      oldPassword: json["old_password"],
      newPassword: json["new_password"],
      newPasswordConfirmation: json["new_password_confirmation"],
    );
  }

  Map<String, dynamic> toJson() => {
        "old_password": oldPassword,
        "new_password": newPassword,
        "new_password_confirmation": newPasswordConfirmation,
      };

  @override
  String toString() {
    return "$oldPassword, $newPassword, $newPasswordConfirmation, ";
  }
}

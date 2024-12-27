class TValidator {
  // Email doğrulama
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // E-posta formatı için düzenli ifade
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  // Şifre doğrulama
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Minimum şifre uzunluğu kontrolü
    if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    }

    // En az bir sayı içeriyor mu?
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // En az bir küçük harf içeriyor mu?
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter.';
    }

    return null;
  }

  // Telefon numarası doğrulama (Daha esnek uluslararası format için)
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Telefon numarası formatı (10-15 haneli uluslararası format)
    final phoneRegExp = RegExp(r'^\+?[0-9]{10,15}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format.';
    }

    return null;
  }

  // İsim doğrulama
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required.';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters long.';
    }

    return null;
  }

  // ReminderMessage doğrulama
  static String? validateReminderMessage(String? value) {
    if (value == null || value.isEmpty) {
      return 'Reminder message is required.';
    }

    if (value.length < 5) {
      return 'Reminder message be at least 5 characters long.';
    }

    return null;
  }

  // Şifre doğrulama (eşleşme)
  static String? validatePasswordConfirmation(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Password confirmation is required.';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match.';
    }

    return null;
  }

  static String? validateRequiredNoSpace(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }

    // Boşluk kontrolü
    if (value.contains(' ')) {
      return 'This field cannot contain spaces.';
    }

    return null;
  }
}

extension GenderExtentions on int {
  /// Converts activity level to its description.
  String get genderToText {
    switch (this) {
      case 1:
        return "Man";
      case 2:
        return "Woman";
      case 3:
        return "Not specified";
      default:
        return "Unknown";
    }
  }
}

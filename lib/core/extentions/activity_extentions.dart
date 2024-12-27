extension ActivityWeatherDescription on int {
  /// Converts activity level to its description.
  String get activityDescription {
    switch (this) {
      case 1:
        return "Light Activity";
      case 2:
        return "Moderate Active";
      case 3:
        return "Very Active";
      default:
        return "Unknown";
    }
  }
}

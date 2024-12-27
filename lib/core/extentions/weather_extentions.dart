extension ActivityWeatherDescription on int {
  /// Converts weather to its description.
  String get weatherDescription {
    switch (this) {
      case 0:
        return "Hot";
      case 1:
        return "Temperature";
      case 2:
        return "Cold";
      default:
        return "Unknown ";
    }
  }
}

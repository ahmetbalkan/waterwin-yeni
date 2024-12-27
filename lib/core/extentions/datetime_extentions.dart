import 'package:intl/intl.dart';

extension DateTimeParsing on String {
  String toFormattedDateTime() {
    // String'i DateTime nesnesine çeviriyoruz
    DateTime dateTime = DateTime.parse(this);
    // İstenilen formatta string olarak döndürüyoruz
    return DateFormat("yyyy-MM-dd / HH:mm").format(dateTime);
  }

  String toFormattedDate() {
    // String'i DateTime nesnesine çeviriyoruz
    DateTime dateTime = DateTime.parse(this);
    // İstenilen formatta string olarak döndürüyoruz
    return DateFormat("yyyy-MM-dd").format(dateTime);
  }

  String toShortTime() {
    if (this.length >= 5) {
      return this.substring(0, 5);
    }
    return this;
  }
}

extension DateTimeFormatting on DateTime? {
  String toFormattedDateTime() {
    if (this == null) return "Invalid Date";
    return DateFormat("yyyy-MM-dd / HH:mm").format(this!);
  }

  String toFormattedDate() {
    if (this == null) return "Invalid Date";
    return DateFormat("yyyy-MM-dd").format(this!);
  }

  String toShortTime() {
    if (this == null) return "Invalid Time";
    return DateFormat("HH:mm").format(this!);
  }
}

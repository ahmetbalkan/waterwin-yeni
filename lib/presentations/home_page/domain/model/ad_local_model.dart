import 'package:floor/floor.dart';

@TypeConverters([DateTimeConverter]) // Dönüştürücü ekleniyor
@entity
class AdModel {
  @primaryKey
  final int id;
  final String name; // Reklam adı
  final DateTime lastSeenDate; // Son gösterim tarihi

  AdModel({
    required this.id,
    required this.name,
    required this.lastSeenDate,
  });
}

class DateTimeConverter extends TypeConverter<DateTime, String> {
  @override
  DateTime decode(String databaseValue) {
    return DateTime.parse(databaseValue);
  }

  @override
  String encode(DateTime value) {
    return value.toIso8601String();
  }
}

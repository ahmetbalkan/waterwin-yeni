import 'package:floor/floor.dart';

@Entity(tableName: 'points')
class PointResponseModel {
  @PrimaryKey(autoGenerate: false)
  final int id;

  int? userId;
  int? glasstype;
  int? wateramount;
  int? adsId;
  int? status;
  int? pointType;
  String? createdAt;
  String? updatedAt;

  PointResponseModel({
    required this.id,
    this.userId,
    this.glasstype,
    this.wateramount,
    this.adsId,
    this.status,
    this.pointType,
    this.createdAt,
    this.updatedAt,
  });

  factory PointResponseModel.fromJson(Map<String, dynamic> json) {
    return PointResponseModel(
      id: json["id"],
      userId: json["user_id"],
      glasstype: json["glasstype"],
      wateramount: json["wateramount"],
      adsId: json["adsId"],
      status: json["status"],
      pointType: json["point_type"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['glasstype'] = glasstype;
    data['wateramount'] = wateramount;
    data['adsId'] = adsId;
    data['status'] = status;
    data['point_type'] = pointType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  @override
  String toString() {
    return "PointResponseModel(id: $id, userId: $userId, glasstype: $glasstype, wateramount: $wateramount, adsId: $adsId, status: $status, pointType: $pointType, createdAt: $createdAt, updatedAt: $updatedAt)";
  }
}

class PointDto {
  PointDto({
    required this.glasstype,
    required this.wateramount,
    required this.adsId,
  });

  final int? glasstype;
  final int? wateramount;
  final dynamic adsId;

  factory PointDto.fromJson(Map<String, dynamic> json) {
    return PointDto(
      glasstype: json["glasstype"],
      wateramount: json["wateramount"],
      adsId: json["adsId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "glasstype": glasstype,
        "wateramount": wateramount,
        "adsId": adsId,
      };

  @override
  String toString() {
    return "$glasstype, $wateramount, $adsId";
  }
}

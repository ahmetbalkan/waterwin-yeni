class PointPageModel {
  PointPageModel({
    required this.totalPoint,
    required this.totalReferralPoints,
    required this.grandTotalPoint,
  });

  final int? totalPoint;
  final int? totalReferralPoints;
  final int? grandTotalPoint;

  factory PointPageModel.fromJson(Map<String, dynamic> json) {
    return PointPageModel(
      totalPoint: json["total_point"],
      totalReferralPoints: json["total_referral_points"],
      grandTotalPoint: json["grand_total_point"],
    );
  }

  Map<String, dynamic> toJson() => {
        "total_point": totalPoint,
        "total_referral_points": totalReferralPoints,
        "grand_total_point": grandTotalPoint,
      };

  @override
  String toString() {
    return "$totalPoint, $totalReferralPoints, $grandTotalPoint, ";
  }
}

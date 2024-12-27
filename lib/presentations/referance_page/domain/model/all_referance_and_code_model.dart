import 'package:waterwin_app/presentations/referance_page/domain/model/referal_response_model.dart';

class AllReferralPointsAndUserCodeModel {
  AllReferralPointsAndUserCodeModel({
    required this.userReferralCode,
    required this.referrals,
  });

  final String? userReferralCode;
  final List<ReferralResponseModel> referrals;

  factory AllReferralPointsAndUserCodeModel.fromJson(
      Map<String, dynamic> json) {
    return AllReferralPointsAndUserCodeModel(
      userReferralCode: json["user_referral_code"],
      referrals: json["referrals"] == null
          ? []
          : List<ReferralResponseModel>.from(
              json["referrals"]!.map((x) => ReferralResponseModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "user_referral_code": userReferralCode,
        "referrals": referrals.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$userReferralCode, $referrals, ";
  }
}

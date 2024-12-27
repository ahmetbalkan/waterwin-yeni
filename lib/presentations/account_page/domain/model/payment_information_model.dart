class PaymentInformationModel {
  PaymentInformationModel({
    required this.id,
    required this.userId,
    required this.walletId,
    required this.createdAt,
    required this.updatedAt,
    required this.paymentMethodId,
  });

  final int? id;
  final int? userId;
  final String? walletId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? paymentMethodId;

  PaymentInformationModel copyWith({
    int? id,
    int? userId,
    String? walletId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? paymentMethodId,
  }) {
    return PaymentInformationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      walletId: walletId ?? this.walletId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
    );
  }

  factory PaymentInformationModel.fromJson(Map<String, dynamic> json) {
    return PaymentInformationModel(
      id: json["id"],
      userId: json["user_id"],
      walletId: json["wallet_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      paymentMethodId: json["payment_method_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "wallet_id": walletId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "payment_method_id": paymentMethodId,
      };

  @override
  String toString() {
    return "$id, $userId, $walletId, $createdAt, $updatedAt, $paymentMethodId, ";
  }
}

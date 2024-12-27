class PaymentRequestModel {
  PaymentRequestModel({
    required this.id,
    required this.userId,
    required this.paymentInfoId,
    required this.status,
    required this.payDate,
    required this.note,
    required this.totalAmount,
    required this.requestTypeId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? userId;
  final int? paymentInfoId;
  final int? status;
  final DateTime? payDate;
  final String? note;
  final double? totalAmount; // Düzeltilmiş alan adı
  final int? requestTypeId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PaymentRequestModel copyWith({
    int? id,
    int? userId,
    int? paymentInfoId,
    int? status,
    DateTime? payDate,
    String? note,
    double? totalAmount, // Düzeltilmiş alan adı
    int? requestTypeId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PaymentRequestModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      paymentInfoId: paymentInfoId ?? this.paymentInfoId,
      status: status ?? this.status,
      payDate: payDate ?? this.payDate,
      note: note ?? this.note,
      totalAmount: totalAmount ?? this.totalAmount,
      requestTypeId: requestTypeId ?? this.requestTypeId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) {
    return PaymentRequestModel(
      id: json["id"],
      userId: json["user_id"],
      paymentInfoId: json["payment_info_id"],
      status: json["status"],
      payDate: DateTime.tryParse(json["pay_date"] ?? ""),
      note: json["note"],
      totalAmount: (json["total_amount"] is String)
          ? double.tryParse(json["total_amount"])
          : json["total_amount"]?.toDouble(), // Düzgün parse işlemi
      requestTypeId: json["request_type_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "payment_info_id": paymentInfoId,
        "status": status,
        "pay_date": payDate?.toIso8601String(),
        "note": note,
        "request_type_id": requestTypeId,
        "total_amount": totalAmount, // Düzeltilmiş alan adı
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return "$id, $userId, $paymentInfoId, $status, $payDate, $note, $requestTypeId, $totalAmount, $createdAt, $updatedAt";
  }
}

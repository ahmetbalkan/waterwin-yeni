import 'package:floor/floor.dart';
import 'profit_data_model.dart';

@Entity(
  tableName: 'profit_statistics',
  foreignKeys: [
    ForeignKey(
      childColumns: ['profitDataId'],
      parentColumns: ['id'],
      entity: ProfitDataModel,
      onDelete: ForeignKeyAction.cascade,
    ),
  ],
)
class ProfitStatisticModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final int? profitDataId; // Foreign key to ProfitDataModel

  final int profitMonth;
  final int profitYear;
  final String totalPoints;
  final double monthlyTotal;
  final String refTotalPoints;
  final double referanceTotal;

  ProfitStatisticModel({
    this.id,
    this.profitDataId,
    required this.profitMonth,
    required this.profitYear,
    required this.totalPoints,
    required this.monthlyTotal,
    required this.refTotalPoints,
    required this.referanceTotal,
  });

  factory ProfitStatisticModel.fromJson(Map<String, dynamic> json) {
    return ProfitStatisticModel(
      id: null, // Will be auto-generated by Floor
      profitDataId: 0, // Will be set later
      profitMonth: json['profit_month'] as int,
      profitYear: json['profit_year'] as int,
      totalPoints: json['total_points'] as String,
      monthlyTotal: (json['monthly_total'] as num).toDouble(),
      refTotalPoints: json['ref_total_points'] as String,
      referanceTotal: (json['referance_total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'profitDataId': profitDataId,
        'profit_month': profitMonth,
        'profit_year': profitYear,
        'total_points': totalPoints,
        'monthly_total': monthlyTotal,
        'ref_total_points': refTotalPoints,
        'referance_total': referanceTotal,
      };

  ProfitStatisticModel copyWith({
    int? id,
    int? profitDataId,
    int? profitMonth,
    int? profitYear,
    String? totalPoints,
    double? monthlyTotal,
    String? refTotalPoints,
    double? referanceTotal,
  }) {
    return ProfitStatisticModel(
      id: id ?? this.id,
      profitDataId: profitDataId ?? this.profitDataId,
      profitMonth: profitMonth ?? this.profitMonth,
      profitYear: profitYear ?? this.profitYear,
      totalPoints: totalPoints ?? this.totalPoints,
      monthlyTotal: monthlyTotal ?? this.monthlyTotal,
      refTotalPoints: refTotalPoints ?? this.refTotalPoints,
      referanceTotal: referanceTotal ?? this.referanceTotal,
    );
  }

  @override
  String toString() {
    return 'ProfitStatisticModel(id: $id, profitDataId: $profitDataId, profitMonth: $profitMonth, profitYear: $profitYear, totalPoints: $totalPoints, monthlyTotal: $monthlyTotal, refTotalPoints: $refTotalPoints, referanceTotal: $referanceTotal)';
  }
}

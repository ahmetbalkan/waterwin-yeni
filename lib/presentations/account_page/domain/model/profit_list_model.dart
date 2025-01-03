import 'package:floor/floor.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/profit_data_model.dart';

@Entity(
  tableName: 'profit_list',
  foreignKeys: [
    ForeignKey(
      childColumns: ['profitDataId'],
      parentColumns: ['id'],
      entity: ProfitDataModel,
      onDelete: ForeignKeyAction.cascade,
    ),
  ],
)
class ProfitListModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final int profitDataId; // Foreign key to ProfitDataModel

  final int profitMonth;
  final int profitYear;
  final double totalPoints;
  final double monthlyTotal;
  final double refTotalPoints;
  final double referanceTotal;

  ProfitListModel({
    this.id,
    required this.profitDataId,
    required this.profitMonth,
    required this.profitYear,
    required this.totalPoints,
    required this.monthlyTotal,
    required this.refTotalPoints,
    required this.referanceTotal,
  });

  factory ProfitListModel.fromJson(Map<String, dynamic> json) {
    return ProfitListModel(
      id: null, // Will be auto-generated by Floor
      profitDataId: 0, // Will be set later
      profitMonth: json['profit_month'] as int,
      profitYear: json['profit_year'] as int,
      totalPoints: double.parse(json['total_points'] as String),
      monthlyTotal: (json['monthly_total'] as num).toDouble(),
      refTotalPoints: double.parse(json['ref_total_points'] as String),
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

  ProfitListModel copyWith({
    int? id,
    int? profitDataId,
    int? profitMonth,
    int? profitYear,
    double? totalPoints,
    double? monthlyTotal,
    double? refTotalPoints,
    double? referanceTotal,
  }) {
    return ProfitListModel(
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
    return 'ProfitListModel(id: $id, profitDataId: $profitDataId, profitMonth: $profitMonth, profitYear: $profitYear, totalPoints: $totalPoints, monthlyTotal: $monthlyTotal, refTotalPoints: $refTotalPoints, referanceTotal: $referanceTotal)';
  }
}

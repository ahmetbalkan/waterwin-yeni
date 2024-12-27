import 'package:floor/floor.dart';
import 'profit_statistic_model.dart';

@Entity(tableName: 'profit_data')
class ProfitDataModel {
  @primaryKey
  final int id; // We'll assign a default ID since the API doesn't provide one.

  final double? normalTotal;
  final double? referenceTotal;

  final String? refreshDate; // Using String? for date

  @ignore
  final List<ProfitStatisticModel>
      profitStatistics; // Not stored directly in the table

  ProfitDataModel({
    required this.id,
    required this.normalTotal,
    required this.referenceTotal,
    this.refreshDate,
    this.profitStatistics = const [], // Made optional with a default empty list
  });

  factory ProfitDataModel.fromJson(Map<String, dynamic> json) {
    return ProfitDataModel(
      id: 1, // Assign a default ID
      normalTotal: (json['total_normal_earnings'] != null)
          ? (json['total_normal_earnings'] as num).toDouble()
          : 0.0, // If null, return 0.0
      referenceTotal: (json['total_reference_earnings'] != null)
          ? (json['total_reference_earnings'] as num).toDouble()
          : 0.0, // If null, return 0.0
      profitStatistics: [], // Since the JSON doesn't include 'profit_statistics'
      refreshDate: null, // Will be set later
    );
  }

  Map<String, dynamic> toJson() => {
        'total_normal_earnings': normalTotal,
        'total_reference_earnings': referenceTotal,
        'refresh_date': refreshDate,
        // 'profit_statistics': profitStatistics.map((e) => e.toJson()).toList(),
      };

  ProfitDataModel copyWith({
    int? id,
    double? normalTotal,
    double? referenceTotal,
    String? refreshDate,
    List<ProfitStatisticModel>? profitStatistics,
  }) {
    return ProfitDataModel(
      id: id ?? this.id,
      normalTotal: normalTotal ?? this.normalTotal,
      referenceTotal: referenceTotal ?? this.referenceTotal,
      refreshDate: refreshDate ?? this.refreshDate,
      profitStatistics: profitStatistics ?? this.profitStatistics,
    );
  }

  @override
  String toString() {
    return 'ProfitDataModel(id: $id, normalTotal: $normalTotal, referenceTotal: $referenceTotal, refreshDate: $refreshDate, profitStatistics: $profitStatistics)';
  }
}

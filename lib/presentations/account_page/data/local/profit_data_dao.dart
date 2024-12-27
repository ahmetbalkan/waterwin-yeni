import 'package:floor/floor.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/profit_data_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/profit_statistic_model.dart';

@dao
abstract class ProfitDao {
  // Insert ProfitDataModel
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProfitData(ProfitDataModel profitData);

  // Insert ProfitStatisticModels
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProfitStatistics(
      List<ProfitStatisticModel> profitStatistics);

  // Clear ProfitData
  @Query('DELETE FROM profit_data')
  Future<void> clearAllProfitData();

  // Clear ProfitStatistics
  @Query('DELETE FROM profit_statistics')
  Future<void> clearAllProfitStatistics();

  // Refresh ProfitData in a transaction
  @transaction
  Future<void> refreshProfitData(ProfitDataModel profitData) async {
    await clearAllProfitData();
    await insertProfitData(profitData);
  }

  // Refresh ProfitStatistics in a transaction
  @transaction
  Future<void> refreshProfitStatistics(
      List<ProfitStatisticModel> profitStatistics) async {
    await clearAllProfitStatistics();
    await insertProfitStatistics(profitStatistics);
  }

  // Get ProfitDataModel
  @Query('SELECT * FROM profit_data LIMIT 1')
  Future<ProfitDataModel?> getProfitData();

  // Get ProfitStatisticModels
  @Query('SELECT * FROM profit_statistics WHERE profitDataId = :profitDataId')
  Future<List<ProfitStatisticModel>> getProfitStatistics(int profitDataId);
}

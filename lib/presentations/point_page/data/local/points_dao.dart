import 'package:floor/floor.dart';
import 'package:waterwin_app/presentations/point_page/domain/model/point_model.dart';

@dao
abstract class PointDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPoint(PointResponseModel point);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPoints(List<PointResponseModel> points);

  @Query('DELETE FROM points')
  Future<void> clearAllPoints();

  @Query('SELECT * FROM points')
  Stream<List<PointResponseModel>> watchAllPoints();

  @Query(
      'SELECT * FROM points ORDER BY createdAt DESC LIMIT :limit OFFSET :offset')
  Stream<List<PointResponseModel>> watchPointsWithPagination(
      int limit, int offset);

  @Query(
      'SELECT * FROM points WHERE DATE(createdAt) == DATE(:date) ORDER BY createdAt DESC')
  Stream<List<PointResponseModel>> watchPointsFromDate(String date);

  @Query(
      'SELECT * FROM points WHERE DATE(createdAt) = DATE(:date) ORDER BY createdAt DESC')
  Future<List<PointResponseModel>> getPointsFromDate(String date);

  @Query(
      'SELECT * FROM points WHERE DATE(createdAt) == DATE(:date) LIMIT :limit OFFSET :offset')
  Stream<List<PointResponseModel>> watchPointsFromDatePagination(
      String date, int limit, int offset);

  @Query(
      'SELECT * FROM points WHERE DATE(createdAt) BETWEEN DATE(:startDate) AND DATE(:endDate)')
  Stream<List<PointResponseModel>> watchPointsForDateRange(
      String startDate, String endDate);

  @Query(
      'SELECT COALESCE(SUM(wateramount), 0) FROM points WHERE DATE(createdAt) == DATE(:date)')
  Stream<int?> watchTotalWaterAmountForDate(String date);

  @Query('SELECT SUM(wateramount) FROM points')
  Stream<int?> watchTotalWaterAmountForAllTime();

  @Query(
      'SELECT * FROM points WHERE DATE(createdAt) BETWEEN DATE(:startOfWeek) AND DATE(:endOfWeek)')
  Stream<List<PointResponseModel>> watchCurrentWeekPoints(
      String startOfWeek, String endOfWeek);

  @Query(
      'SELECT * FROM points WHERE DATE(createdAt) BETWEEN DATE(:startOfWeek) AND DATE(:endOfWeek)')
  Future<List<PointResponseModel>> getCurrentWeekPoints(
      String startOfWeek, String endOfWeek);

  @Query(
      'SELECT * FROM points WHERE DATE(createdAt) BETWEEN DATE(:startOfMonth) AND DATE(:endOfMonth)')
  Stream<List<PointResponseModel>> watchCurrentMonthPoints(
      String startOfMonth, String endOfMonth);

  @Query(
      'SELECT * FROM points WHERE DATE(createdAt) BETWEEN DATE(:startOfMonth) AND DATE(:endOfMonth)')
  Future<List<PointResponseModel>> getCurrentMonthPoints(
      String startOfMonth, String endOfMonth);

  // En eski veri tarihini alır
  @Query('SELECT createdAt FROM points ORDER BY createdAt ASC LIMIT 1')
  Future<String?> getFirstDataDate();

  // En yeni veri tarihini alır
  @Query('SELECT createdAt FROM points ORDER BY createdAt DESC LIMIT 1')
  Future<String?> getLastDataDate();
}

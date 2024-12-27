import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/information_page/domain/repository/local/information_local_repository.dart';
import 'package:waterwin_app/presentations/point_page/data/local/points_dao.dart';
import 'package:waterwin_app/presentations/point_page/domain/model/point_model.dart';
import 'package:waterwin_app/presentations/statistic_page/domain/model/model/bottle_model.dart';
import 'package:waterwin_app/presentations/statistic_page/domain/model/model/water_intake_model.dart';

part 'statistic_state.dart';
part 'statistic_cubit.freezed.dart';

class StatisticCubit extends Cubit<StatisticState> {
  StatisticCubit({
    PointDao? pointDao,
    InformationLocalRepository? informationRepository,
  }) : super(StatisticState.initial()) {
    _pointDao = pointDao ?? getIt<PointDao>();
    _informationRepository =
        informationRepository ?? getIt<InformationLocalRepository>();
    _initializeDailyGoal();
    getAllTimeWaterIntake();
  }

  late final PointDao _pointDao;
  late final InformationLocalRepository _informationRepository;
  StreamSubscription<List<PointResponseModel>>? _subscription;
  DateTime currentWeekStart =
      DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
  DateTime currentMonthStart =
      DateTime(DateTime.now().year, DateTime.now().month, 1);

  final Map<int, int> glasstypeMlValues = {
    1: 25,
    2: 50,
    3: 100,
    4: 125,
    5: 150,
    6: 200,
    7: 250,
    8: 300,
    9: 350,
    10: 400,
    11: 500,
    12: 600,
  };

  Future<void> _initializeDailyGoal() async {
    final information = await _informationRepository.getFirstInformation();
    final dailyGoal = information?.dailyGoal ?? 2000;
    emit(state.copyWith(dailyGoal: dailyGoal));
  }

  void loadAllWaterIntake() {
    emit(state.copyWith(
      tabStatus: TabStatus.all,
    ));
  }

  /// All-time data retrieval for drink types but not for daily percentages.
  void getAllTimeWaterIntake() {
    _subscription?.cancel();
    _subscription = _pointDao.watchAllPoints().listen((points) {
      final bottles = _convertPointsToBottles(points);
      emit(state.copyWith(
        bottles: bottles,
        dailyWaterIntakeData: [], // Percentage data is empty for all-time
        tabStatus: TabStatus.all,
        status: StatisticStatus.loaded,
        message: "Sadece haftalık ve aylık görüntüleme yapabilirsiniz",
      ));
    }, onError: (_) {
      emit(state.copyWith(
        status: StatisticStatus.error,
        message: "Failed to load all-time data.",
      ));
    });
  }

  void loadWeeklyWaterIntake(int direction) {
    _subscription?.cancel();

    // Yeni haftayı direction parametresine göre ayarla
    final newWeekStart = currentWeekStart.add(Duration(days: 7 * direction));
    final endOfWeek = newWeekStart.add(const Duration(days: 6));

    // Haftalık veriyi veri tabanından al
    _pointDao
        .watchCurrentWeekPoints(DateFormat('yyyy-MM-dd').format(newWeekStart),
            DateFormat('yyyy-MM-dd').format(endOfWeek))
        .first
        .then((points) {
      if (points.isEmpty) {
        // Eğer veri yoksa ve geçmişe doğru gidiliyorsa
        if (direction < 0) {
          emit(state.copyWith(
            status: StatisticStatus.error,
            message: "Daha fazla veri yok.",
          ));
        } else {
          emit(state.copyWith(
            status: StatisticStatus.error,
            message: "Seçilen hafta için veri bulunamadı.",
          ));
        }
      } else {
        // Haftanın verisi mevcutsa, yeni hafta verilerini ayarla
        currentWeekStart = newWeekStart;
        final bottles = _convertPointsToBottles(points);
        final dailyData = _convertPointsToDailyWaterIntake(points);
        emit(state.copyWith(
          bottles: bottles,
          dailyWaterIntakeData: dailyData,
          tabStatus: TabStatus.weekly,
          status: StatisticStatus.loaded,
          message: "",
        ));
      }
    }).catchError((_) {
      emit(state.copyWith(
        status: StatisticStatus.error,
        message: "Haftalık veri yüklenirken bir hata oluştu.",
      ));
    });
  }

  /// Retrieves monthly water intake for the selected month.
  void loadMonthlyWaterIntake(int direction) {
    _subscription?.cancel();
    final newMonthStart = DateTime(
        currentMonthStart.year, currentMonthStart.month + direction, 1);
    final endOfMonth = DateTime(newMonthStart.year, newMonthStart.month + 1, 0);

    _pointDao
        .watchCurrentMonthPoints(DateFormat('yyyy-MM-dd').format(newMonthStart),
            DateFormat('yyyy-MM-dd').format(endOfMonth))
        .first
        .then((points) {
      if (points.isEmpty) {
        emit(state.copyWith(
          status: StatisticStatus.error,
          message: "There is no data for the selected month.",
        ));
      } else {
        currentMonthStart = newMonthStart;
        final bottles = _convertPointsToBottles(points);
        final dailyData = _convertPointsToDailyWaterIntake(points);
        emit(state.copyWith(
          bottles: bottles,
          dailyWaterIntakeData: dailyData,
          tabStatus: TabStatus.monthly,
          status: StatisticStatus.loaded,
          message: "",
        ));
      }
    }).catchError((_) {
      emit(state.copyWith(
        status: StatisticStatus.error,
        message: "An error occurred while loading monthly data.",
      ));
    });
  }

  /// Formats the date range based on the current tab status.
  String getFormattedDateRange() {
    if (state.tabStatus == TabStatus.weekly) {
      final endOfWeek = currentWeekStart.add(const Duration(days: 6));
      return "${DateFormat('MMM dd').format(currentWeekStart)} - ${DateFormat('MMM dd, yyyy').format(endOfWeek)}";
    } else if (state.tabStatus == TabStatus.monthly) {
      return DateFormat('MMMM yyyy').format(currentMonthStart);
    }
    return "";
  }

  /// Converts points data to daily water intake data for percentage display.
  List<WaterIntakeModel> _convertPointsToDailyWaterIntake(
      List<PointResponseModel> points) {
    final Map<String, int> dailyConsumption = {};

    for (var point in points) {
      final date = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(point.createdAt ?? "2021-01-01"));
      dailyConsumption[date] =
          (dailyConsumption[date] ?? 0) + (point.wateramount ?? 0);
    }

    // Tarih sıralamasını sağla ve tersine çevir
    final sortedEntries = dailyConsumption.entries.toList()
      ..sort((a, b) => DateTime.parse(a.key).compareTo(DateTime.parse(b.key)))
      ..reversed;

    return sortedEntries.map((entry) {
      final date = DateTime.parse(entry.key);
      final totalAmount = entry.value;
      return WaterIntakeModel(
        current: totalAmount.toDouble(),
        dailyLimit: state.dailyGoal.toDouble(),
        date: date,
      );
    }).toList();
  }

  /// Converts points data to bottle model data for drink type display.
  List<BottleModel> _convertPointsToBottles(List<PointResponseModel> points) {
    final Map<int, int> groupedAmounts = {};

    for (var point in points) {
      final glasstype = point.glasstype ?? 0;
      final waterAmount = point.wateramount ?? 0;

      if (groupedAmounts.containsKey(glasstype)) {
        groupedAmounts[glasstype] = groupedAmounts[glasstype]! + waterAmount;
      } else {
        groupedAmounts[glasstype] = waterAmount;
      }
    }

    return groupedAmounts.entries.map((entry) {
      final glasstype = entry.key;
      final totalAmount = entry.value;
      final glassMl = glasstypeMlValues[glasstype] ?? 0;

      return BottleModel(
        id: glasstype,
        svgAsset: "assets/$glasstype.svg",
        name: "$glassMl ml",
        ml: totalAmount,
      );
    }).toList();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

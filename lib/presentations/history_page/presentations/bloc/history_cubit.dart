import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/history_page/presentations/history_page.dart';
import 'package:waterwin_app/presentations/point_page/data/local/points_dao.dart';
import 'package:waterwin_app/presentations/point_page/domain/model/point_model.dart';

part 'history_state.dart';
part 'history_cubit.freezed.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit({
    PointDao? pointDao,
  }) : super(HistoryState.initial()) {
    _pointDao = pointDao ?? getIt<PointDao>();
    _initializeTodayHistoryStream(DateTime.now());
    _initializeDates();
  }

  late final PointDao _pointDao;
  StreamSubscription<List<PointResponseModel>>? _pointsSubscription;

  // Tarihler listesini başlatır
  void _initializeDates() {
    final List<DayProgressModel> initialDates = List.generate(
      7,
      (index) => DayProgressModel(
        date: DateTime.now().subtract(Duration(days: index)),
        progress: (index + 1) * 0.1,
      ),
    );
    emit(state.copyWith(
        dates: initialDates, selectedIndex: 0, isLoading: false));
  }

  // Tarih seçimini günceller
  void selectDate(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void _initializeTodayHistoryStream(DateTime date) {
    emit(state.copyWith(status: HistoryStatus.loading));
    _pointsSubscription = _pointDao
        .watchPointsFromDate(date.toIso8601String().split('T')[0])
        .listen((points) {
      emit(state.copyWith(
          status: HistoryStatus.loaded, points: points, page: state.page));
    }, onError: (error) {
      emit(state.copyWith(status: HistoryStatus.error));
    });
  }

  void addPage() {
    final newPage = state.page + 1;
    emit(state.copyWith(status: HistoryStatus.loading, page: newPage));
    _pointsSubscription?.cancel();
    _pointsSubscription = _pointDao
        .watchPointsFromDate(DateTime.now().toIso8601String().split('T')[0])
        .listen((points) {
      emit(state.copyWith(
          status: HistoryStatus.loaded,
          points: [...state.points, ...points],
          page: newPage));
    }, onError: (error) {
      emit(state.copyWith(status: HistoryStatus.error));
    });
  }

  // Tarih değiştirildiğinde çağrılan fonksiyon
  void changeHistoryDate(DateTime date) {
    emit(state.copyWith(status: HistoryStatus.loading, page: 1));
    _pointsSubscription?.cancel(); // Mevcut StreamSubscription'ı iptal et
    _initializeTodayHistoryStream(date); // Yeni tarih ile dinlemeye başla
  }

  @override
  Future<void> close() {
    _pointsSubscription?.cancel();
    return super.close();
  }
}

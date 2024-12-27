import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/presentations/home_page/data/local/ad_dao.dart';
import 'package:waterwin_app/presentations/home_page/domain/ad_managers/ad_manager.dart';
import 'package:waterwin_app/presentations/home_page/domain/model/ad_local_model.dart';
import 'package:waterwin_app/presentations/information_page/data/data_source/local/information_dao.dart';
import 'package:waterwin_app/presentations/information_page/domain/model/information_model.dart';
import 'package:waterwin_app/presentations/point_page/data/dto/point_dto.dart';
import 'package:waterwin_app/presentations/point_page/data/local/points_dao.dart';
import 'package:waterwin_app/presentations/point_page/domain/model/point_model.dart';
import 'package:waterwin_app/presentations/point_page/domain/repository/remote/point_remote_repository.dart';
import 'package:waterwin_app/presentations/statistic_page/domain/model/bottle_model.dart';

part 'homepage_state.dart';
part 'homepage_cubit.freezed.dart';

class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit({
    PointDao? pointdao,
    InformationDao? informationdao,
    AdManager? adManager,
    PointRemoteRepository? pointRemoteRepository,
    AdDao? adDao,
  }) : super(HomepageState.initial()) {
    _pointdao = pointdao ?? getIt<PointDao>();
    _informationDao = informationdao ?? getIt<InformationDao>();
    _adManager = adManager ?? getIt<AdManager>();
    _pointRemoteRepository =
        pointRemoteRepository ?? getIt<PointRemoteRepository>();
    _adDao = adDao ?? getIt<AdDao>();

    _initializePointsStream();
    _getHomeCircularPoint(DateTime.now());
    _initializeAds(); // Reklam veritabanını başlatma
    _startTimer();
  }

  late final PointDao _pointdao;
  late final InformationDao _informationDao;
  late final AdManager _adManager;
  late final PointRemoteRepository _pointRemoteRepository;
  late final AdDao _adDao;
  Timer? _timer;

  StreamSubscription<List<PointResponseModel>>? _pointsSubscription;
  StreamSubscription<int?>? _waterAmountSubscription;
  StreamSubscription<InformationModel?>? _dailyGoalSubscription;

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      await _checkButtonStatus();
    });
  }

  Future<void> _checkButtonStatus() async {
    final ads = await _adDao.getAllAds();
    if (ads.isNotEmpty) {
      bool allAdsEnabled = true;
      int minRemainingSeconds = 0;

      for (var ad in ads) {
        final now = DateTime.now();
        final lastSeenPlusFiveMinutes =
            ad.lastSeenDate.add(const Duration(minutes: 5));
        final remainingSeconds =
            lastSeenPlusFiveMinutes.difference(now).inSeconds;

        if (remainingSeconds > 0) {
          allAdsEnabled = false;
          if (minRemainingSeconds == 0 ||
              remainingSeconds < minRemainingSeconds) {
            minRemainingSeconds = remainingSeconds;
          }
        }
      }

      emit(state.copyWith(
        isButtonEnabled: allAdsEnabled,
        remainingSeconds: allAdsEnabled ? 0 : minRemainingSeconds,
      ));
    } else {
      emit(state.copyWith(isButtonEnabled: true, remainingSeconds: 0));
    }
  }

  Future<void> handleDrinkButtonClick() async {
    final now = DateTime.now();
    final nextAd = await _adDao.getNextAdToShow();

    if (nextAd != null) {
      await _adDao.updateAd(
        AdModel(
          id: nextAd.id,
          name: nextAd.name,
          lastSeenDate: now,
        ),
      );
    }

    emit(state.copyWith(isButtonEnabled: false));
    _startTimer();
  }

  void changeBottle(BottleModel newBottle) {
    emit(state.copyWith(bottle: newBottle));
  }

  void _initializePointsStream() {
    emit(state.copyWith(status: HomepageStatus.loading));
    _pointsSubscription = _pointdao.watchPointsWithPagination(10, 0).listen(
      (points) {
        emit(state.copyWith(
            status: HomepageStatus.loaded, points: points.toList()));
      },
      onError: (error) {
        emit(state.copyWith(status: HomepageStatus.error));
      },
    );
  }

  Future<void> _getHomeCircularPoint(DateTime date) async {
    _dailyGoalSubscription = _informationDao.watchInformation().listen(
      (information) {
        emit(state.copyWith(
          totalDays: information?.dailyGoal ?? 0,
        ));
      },
      onError: (error) {
        emit(state.copyWith(status: HomepageStatus.error));
      },
    );

    _waterAmountSubscription = _pointdao
        .watchTotalWaterAmountForDate(date.toIso8601String().split('T')[0])
        .listen(
      (waterAmount) {
        emit(state.copyWith(
          totalPoints: waterAmount ?? 0,
        ));
      },
      onError: (error) {
        emit(state.copyWith(status: HomepageStatus.error));
      },
    );
  }

  Future<void> _initializeAds() async {
    final ads = await _adDao.getAllAds();
    if (ads.isEmpty) {
      await _adDao.insertAd(
        AdModel(id: 1, name: 'Google', lastSeenDate: DateTime(2000)),
      );
      await _adDao.insertAd(
        AdModel(id: 2, name: 'Unity', lastSeenDate: DateTime(2000)),
      );
    }
  }

  Future<void> loadAndShowRewardedAd() async {
    try {
      emit(state.copyWith(
          status: HomepageStatus.loading, isButtonEnabled: false));

      final nextAd = await _adDao.getNextAdToShow();
      if (nextAd != null) {
        if (nextAd.id == 1) {
          await _adManager.loadAdmobRewardedAd();
          await _adManager.showAdmobRewardedAd(() async {
            await _updateAdDate(nextAd.id);
            await _handleAdSuccess(nextAd.id);
            _startRewardCooldown(nextAd.id);
          });
        } else if (nextAd.id == 2) {
          await _adManager.loadUnityRewardedAd();
          await _adManager.showUnityRewardedAd(() async {
            await _updateAdDate(nextAd.id);
            await _handleAdSuccess(nextAd.id);
            _startRewardCooldown(nextAd.id);
          });
        }
      }

      emit(state.copyWith(status: HomepageStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: HomepageStatus.error, isButtonEnabled: true));
      print('Reklam yükleme veya gösterim hatası: $e');
    }
  }

  Future<void> _startRewardCooldown(int adId) async {
    final now = DateTime.now();
    final ad = await _adDao.getAdById(adId);

    if (ad != null) {
      // Reklamın izlenme tarihini güncelle
      await _adDao.updateAd(
        AdModel(
          id: ad.id,
          name: ad.name,
          lastSeenDate: now,
        ),
      );

      emit(state.copyWith(isButtonEnabled: false, remainingSeconds: 300));

      // Geri sayımı tetiklemek için timer başlat
      _startTimer();
    }
  }

  Future<void> _updateAdDate(int adId) async {
    final ad = await _adDao.getAdById(adId);
    if (ad != null) {
      await _adDao.updateAd(
        AdModel(
          id: ad.id,
          name: ad.name,
          lastSeenDate: DateTime.now(),
        ),
      );
    }
  }

  Future<void> _handleAdSuccess(int adId) async {
    final pointDto = PointDto(
      glasstype: state.bottle.id,
      wateramount: state.bottle.ml,
      adsId: adId,
    );

    final result = await _pointRemoteRepository.addPoint(pointDto);

    result.fold(
      (exception) {
        emit(state.copyWith(status: HomepageStatus.error));
      },
      (_) {
        emit(state.copyWith(status: HomepageStatus.loaded));
        _startTimer();
      },
    );
  }

  @override
  Future<void> close() {
    _pointsSubscription?.cancel();
    _dailyGoalSubscription?.cancel();
    _waterAmountSubscription?.cancel();
    return super.close();
  }
}

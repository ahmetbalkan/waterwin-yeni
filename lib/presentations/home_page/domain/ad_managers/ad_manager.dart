import 'dart:async';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

@lazySingleton
class AdManager {
  // AdMob
  RewardedAd? _admobRewardedAd;
  bool _isAdmobRewardedAdLoaded = false;

  // Unity
  bool _isUnityAdLoaded = false;

  // Getter for checking ad load status
  bool get isAdmobRewardedAdLoaded => _isAdmobRewardedAdLoaded;
  bool get isUnityRewardedAdLoaded => _isUnityAdLoaded;

  // AdMob Load
  Future<void> loadAdmobRewardedAd() async {
    final completer = Completer<void>();
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917', // Test ID
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _admobRewardedAd = ad;
          _isAdmobRewardedAdLoaded = true;
          completer.complete();
        },
        onAdFailedToLoad: (error) {
          _isAdmobRewardedAdLoaded = false;
          completer.completeError(error);
        },
      ),
    );
    await completer.future;
  }

  // AdMob Show
  Future<void> showAdmobRewardedAd(Function onRewardEarned) async {
    if (_isAdmobRewardedAdLoaded && _admobRewardedAd != null) {
      final completer = Completer<void>();
      _admobRewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          onRewardEarned();
          completer.complete();
        },
      );
      await completer.future;
    } else {
      throw Exception('AdMob ödüllü reklam henüz yüklenmedi.');
    }
  }

  // Unity Load
  Future<void> loadUnityRewardedAd() async {
    final completer = Completer<void>();
    UnityAds.load(
      placementId: 'rewardedandroid',
      onComplete: (placementId) {
        _isUnityAdLoaded = true;
        completer.complete();
      },
      onFailed: (placementId, error, message) {
        _isUnityAdLoaded = false;
        completer.completeError(Exception(message));
      },
    );
    await completer.future;
  }

  // Unity Show
  Future<void> showUnityRewardedAd(Function onRewardEarned) async {
    if (_isUnityAdLoaded) {
      final completer = Completer<void>();
      UnityAds.showVideoAd(
        placementId: 'rewardedandroid',
        onComplete: (placementId) {
          onRewardEarned();
          completer.complete();
        },
        onFailed: (placementId, error, message) {
          completer.completeError(Exception(message));
        },
      );
      await completer.future;
    } else {
      throw Exception('Unity ödüllü reklam henüz yüklenmedi.');
    }
  }
}

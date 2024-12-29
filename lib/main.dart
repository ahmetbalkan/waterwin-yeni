import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:waterwin_app/core/firebase_init.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/firebase_options.dart';
import 'package:waterwin_app/presentations/waterwin_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseApi().initNotifications();
  await configureDependencies();
  await MobileAds.instance.initialize();
  UnityAds.init(
    gameId: _getUnityGameId(),
    testMode: true,
  );

  runApp(const MyApp());
}

String _getUnityGameId() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    return '5738321'; // Android Game ID
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    return '5738320'; // iOS Game ID
  } else {
    throw UnsupportedError('Unity Ads sadece Android ve iOS destekler.');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      child: WaterWinWidget(),
    );
  }
}

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@singleton
class FirebaseApi {
  // Firebase Messaging örneği oluştur
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Bildirimleri başlatmak için bir fonksiyon
  Future<void> initNotifications() async {
    // Kullanıcıdan bildirim izni isteme
    await _firebaseMessaging.requestPermission();
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Bu cihaz için FCM token'ı al
    final fCMToken = await _firebaseMessaging.getToken();

    // Token'ı yazdır (Normalde bu token'ı sunucuya gönderirsiniz)
    log('Token: $fCMToken');
  }

  Future<String> getFCMToken() async {
    var fcm = await _firebaseMessaging.getToken();

    return fcm ?? '';
  }

  // Gelen mesajları işlemek için bir fonksiyon (isteğe bağlı eklenebilir)
  void handleReceivedMessages() {
    // Burada gelen mesajları işleme kodlarınızı ekleyebilirsiniz
  }

  // Ön plan ve arka plan ayarlarını başlatmak için bir fonksiyon (isteğe bağlı eklenebilir)
  void initForegroundAndBackgroundSettings() {
    // Ön plan/arka plan ayarları için yapılandırmalar
  }
}

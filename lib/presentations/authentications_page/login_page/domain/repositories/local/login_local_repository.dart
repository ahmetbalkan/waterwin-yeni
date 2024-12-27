import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/data/data_source/local/auth_dao.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/model/auth_response_model.dart';

@injectable
class LoginLocalRepository {
  final AuthDao _authDao;

  LoginLocalRepository(this._authDao);

  Future<void> insertAuthData(AuthResponseModel authData) async {
    // Veritabanında auth kaydı var mı kontrol et

    _authDao.clearAuthData(); // Eğer varsa sil
    log(authData.toString());
    await _authDao.insertAuth(authData); // Yeni kaydı ekle
  }

  Future<String?> getToken() async {
    final authModel = await _authDao.getFirstAuth();
    return authModel?.token;
  }

  Future<String?> getRefreshToken() async {
    final authModel = await _authDao.getFirstAuth();
    return authModel?.refreshToken;
  }

  Future<AuthResponseModel?> getFirstAuthData() async {
    return await _authDao.getFirstAuth();
  }

  Future<void> updateToken(String token, String refreshToken) async {
    final authModel = await _authDao.getFirstAuth();
    if (authModel != null) {
      authModel.token = token;
      authModel.refreshToken = refreshToken;
      await _authDao.insertAuth(authModel); // Güncellenmiş modeli kaydet
    }
  }

  Future<void> clearAuthData() async {
    await _authDao.clearAuthData();
  }
}

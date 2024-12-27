import 'dart:async';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/auth_local_repository.dart';
import 'package:waterwin_app/presentations/information_page/data/data_source/local/information_dao.dart';
import 'package:waterwin_app/presentations/point_page/data/local/points_dao.dart';
import 'package:waterwin_app/presentations/account_page/data/local/profit_data_dao.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocalRepository _authLocalRepository;
  final InformationDao _informationDao;
  final PointDao _pointDao;
  final ProfitDao _profitDao;
  final Dio _dio;
  final GoRouter _goRouter;

  bool _isRefreshing = false;
  bool _redirecting = false;
  late Completer<void> _refreshCompleter;

  AuthInterceptor({
    required AuthLocalRepository authLocalRepository,
    required InformationDao informationDao,
    required PointDao pointDao,
    required ProfitDao profitDao,
    required Dio dio,
    required GoRouter goRouter,
  })  : _authLocalRepository = authLocalRepository,
        _informationDao = informationDao,
        _pointDao = pointDao,
        _profitDao = profitDao,
        _dio = dio,
        _goRouter = goRouter;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _authLocalRepository.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final options = err.requestOptions;

      if (!_isRefreshing) {
        _isRefreshing = true;
        _refreshCompleter = Completer<void>();

        try {
          final refreshToken = await _authLocalRepository.getRefreshToken();
          if (refreshToken != null) {
            // Token yenileme işlemi
            final newTokens = await _refreshTokens(refreshToken);
            if (newTokens == null) {
              await _clearAllDataAndRedirectToLogin();
            }
          } else {
            await _clearAllDataAndRedirectToLogin();
          }
        } catch (e) {
          await _clearAllDataAndRedirectToLogin();
          _refreshCompleter.completeError(e);
        } finally {
          _isRefreshing = false;
        }
      } else {
        await _refreshCompleter.future;
      }

      try {
        final newToken = await _authLocalRepository.getToken();
        if (newToken != null) {
          options.headers['Authorization'] = 'Bearer $newToken';
        }
        final retryResponse = await _dio.fetch(options);
        handler.resolve(retryResponse);
      } catch (e) {
        handler.next(err);
      }
    } else if (err.response?.statusCode == 400) {
      await _clearAllDataAndRedirectToLogin();
    } else {
      handler.next(err);
    }
  }

  Future<Map<String, String>?> _refreshTokens(String refreshToken) async {
    try {
      final response = await _dio.post(
        '/auth/refresh-token',
        data: {'refresh_token': refreshToken},
      );

      if (response.statusCode == 200 && response.data != null) {
        final newToken = response.data['token'];
        final newRefreshToken = response.data['refresh_token'];
        await _authLocalRepository.updateToken(newToken, newRefreshToken);
        _refreshCompleter.complete();
        return {'token': newToken, 'refreshToken': newRefreshToken};
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> _clearAllDataAndRedirectToLogin() async {
    await _authLocalRepository.clearAuthData();
    await _informationDao.clearInformationData();
    await _pointDao.clearAllPoints();
    await _profitDao.clearAllProfitData();

    if (!_redirecting) {
      _redirecting = true;
      _goRouter.go('/refreshfailed');
    }
  }
}

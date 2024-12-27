import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:waterwin_app/core/constants/app_constants.dart';
import 'package:waterwin_app/core/network/auth_interceptor.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/auth_local_repository.dart';
import 'package:waterwin_app/presentations/information_page/data/data_source/local/information_dao.dart';
import 'package:waterwin_app/presentations/point_page/data/local/points_dao.dart';
import 'package:waterwin_app/presentations/account_page/data/local/profit_data_dao.dart';
import 'package:go_router/go_router.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(
    AuthLocalRepository authLocalRepository,
    InformationDao informationDao,
    PointDao pointDao,
    ProfitDao profitDao,
    GoRouter goRouter,
  ) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(AuthInterceptor(
      authLocalRepository: authLocalRepository,
      informationDao: informationDao,
      pointDao: pointDao,
      profitDao: profitDao,
      dio: dio,
      goRouter: goRouter,
    ));
    return dio;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:waterwin_app/core/firebase_init.dart' as _i700;
import 'package:waterwin_app/core/local_database/app_database.dart' as _i151;
import 'package:waterwin_app/core/local_database/app_database_module.dart'
    as _i484;
import 'package:waterwin_app/core/navigations/go_router.dart' as _i825;
import 'package:waterwin_app/core/network/network_module.dart' as _i664;
import 'package:waterwin_app/presentations/account_page/data/local/profit_data_dao.dart'
    as _i46;
import 'package:waterwin_app/presentations/account_page/data/remote/change_password_data_source.dart'
    as _i729;
import 'package:waterwin_app/presentations/account_page/data/remote/drink_reminder_data_source.dart'
    as _i856;
import 'package:waterwin_app/presentations/account_page/data/remote/profit_data_source.dart'
    as _i512;
import 'package:waterwin_app/presentations/account_page/domain/repository/change_password_repository.dart'
    as _i482;
import 'package:waterwin_app/presentations/account_page/domain/repository/profit_repository.dart'
    as _i962;
import 'package:waterwin_app/presentations/account_page/domain/repository/reminder_repository.dart'
    as _i702;
import 'package:waterwin_app/presentations/account_page/presentations/admin_page/data/admin_data_source.dart'
    as _i807;
import 'package:waterwin_app/presentations/account_page/presentations/admin_page/domain/repositories/remote/admin_remote_repository.dart'
    as _i228;
import 'package:waterwin_app/presentations/authentications_page/forgot_password_pages/data/remote/forgotpassword_data_source.dart'
    as _i705;
import 'package:waterwin_app/presentations/authentications_page/forgot_password_pages/domain/repository/remote/forgotpassword_remote_repository.dart'
    as _i857;
import 'package:waterwin_app/presentations/authentications_page/login_page/data/data_source/local/auth_dao.dart'
    as _i587;
import 'package:waterwin_app/presentations/authentications_page/login_page/data/data_source/remote/auth_data_source.dart'
    as _i528;
import 'package:waterwin_app/presentations/authentications_page/login_page/data/data_source/remote/login_data_source.dart'
    as _i152;
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/auth_local_repository.dart'
    as _i982;
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/login_local_repository.dart'
    as _i937;
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/remote/auth_remote_repository.dart'
    as _i481;
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/remote/login_remote_repository.dart'
    as _i793;
import 'package:waterwin_app/presentations/authentications_page/register_page/data/remote/register_data_source.dart'
    as _i1009;
import 'package:waterwin_app/presentations/authentications_page/register_page/domain/repository/register_remote_repository.dart'
    as _i562;
import 'package:waterwin_app/presentations/home_page/data/local/ad_dao.dart'
    as _i265;
import 'package:waterwin_app/presentations/home_page/domain/ad_managers/ad_manager.dart'
    as _i1041;
import 'package:waterwin_app/presentations/information_page/data/data_source/local/information_dao.dart'
    as _i2;
import 'package:waterwin_app/presentations/information_page/data/data_source/remote/information_data_source.dart'
    as _i845;
import 'package:waterwin_app/presentations/information_page/domain/repository/local/information_local_repository.dart'
    as _i235;
import 'package:waterwin_app/presentations/information_page/domain/repository/remote/information_remote_repository.dart'
    as _i277;
import 'package:waterwin_app/presentations/point_page/data/local/points_dao.dart'
    as _i756;
import 'package:waterwin_app/presentations/point_page/data/remote/point_data_source.dart'
    as _i407;
import 'package:waterwin_app/presentations/point_page/domain/repository/local/point_local_repository.dart'
    as _i508;
import 'package:waterwin_app/presentations/point_page/domain/repository/remote/point_remote_repository.dart'
    as _i1059;
import 'package:waterwin_app/presentations/referance_page/data/referance_data_source.dart'
    as _i571;
import 'package:waterwin_app/presentations/referance_page/domain/repository/referance_remote_repository.dart'
    as _i328;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final databaseModule = _$DatabaseModule();
    final routerModule = _$RouterModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i151.AppDatabase>(
      () => databaseModule.provideDatabase(),
      preResolve: true,
    );
    gh.singleton<_i700.FirebaseApi>(() => _i700.FirebaseApi());
    gh.lazySingleton<_i583.GoRouter>(() => routerModule.goRouter());
    gh.lazySingleton<_i1041.AdManager>(() => _i1041.AdManager());
    gh.factory<_i587.AuthDao>(
        () => databaseModule.provideAuthDao(gh<_i151.AppDatabase>()));
    gh.factory<_i2.InformationDao>(
        () => databaseModule.provideInformationDao(gh<_i151.AppDatabase>()));
    gh.factory<_i756.PointDao>(
        () => databaseModule.providePointDao(gh<_i151.AppDatabase>()));
    gh.factory<_i46.ProfitDao>(
        () => databaseModule.provideProfitDao(gh<_i151.AppDatabase>()));
    gh.factory<_i265.AdDao>(
        () => databaseModule.provideAdDao(gh<_i151.AppDatabase>()));
    gh.factory<_i982.AuthLocalRepository>(
        () => _i982.AuthLocalRepository(gh<_i587.AuthDao>()));
    gh.factory<_i937.LoginLocalRepository>(
        () => _i937.LoginLocalRepository(gh<_i587.AuthDao>()));
    gh.factory<_i235.InformationLocalRepository>(
        () => _i235.InformationLocalRepository(gh<_i2.InformationDao>()));
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(
          gh<_i982.AuthLocalRepository>(),
          gh<_i2.InformationDao>(),
          gh<_i756.PointDao>(),
          gh<_i46.ProfitDao>(),
          gh<_i583.GoRouter>(),
        ));
    gh.factory<_i508.PointLocalRepository>(
        () => _i508.PointLocalRepository(gh<_i756.PointDao>()));
    gh.singleton<_i729.ChangePasswordDataSource>(
        () => _i729.ChangePasswordDataSource(gh<_i361.Dio>()));
    gh.singleton<_i856.DrinkReminderDataSource>(
        () => _i856.DrinkReminderDataSource(gh<_i361.Dio>()));
    gh.singleton<_i512.ProfitDataSource>(
        () => _i512.ProfitDataSource(gh<_i361.Dio>()));
    gh.singleton<_i807.AdminDataSource>(
        () => _i807.AdminDataSource(gh<_i361.Dio>()));
    gh.singleton<_i705.ForgotPasswordDataSource>(
        () => _i705.ForgotPasswordDataSource(gh<_i361.Dio>()));
    gh.singleton<_i528.AuthDataSource>(
        () => _i528.AuthDataSource(gh<_i361.Dio>()));
    gh.singleton<_i152.LoginDataSource>(
        () => _i152.LoginDataSource(gh<_i361.Dio>()));
    gh.singleton<_i1009.RegisterDataSource>(
        () => _i1009.RegisterDataSource(gh<_i361.Dio>()));
    gh.singleton<_i845.InformationDataSource>(
        () => _i845.InformationDataSource(gh<_i361.Dio>()));
    gh.singleton<_i407.PointDataSource>(
        () => _i407.PointDataSource(gh<_i361.Dio>()));
    gh.singleton<_i571.ReferanceDataSource>(
        () => _i571.ReferanceDataSource(gh<_i361.Dio>()));
    gh.factory<_i962.ProfitRepository>(() => _i962.ProfitRepository(
          gh<_i512.ProfitDataSource>(),
          gh<_i982.AuthLocalRepository>(),
          gh<_i46.ProfitDao>(),
        ));
    gh.factory<_i1059.PointRemoteRepository>(() => _i1059.PointRemoteRepository(
          gh<_i407.PointDataSource>(),
          gh<_i508.PointLocalRepository>(),
          gh<_i982.AuthLocalRepository>(),
        ));
    gh.factory<_i328.ReferanceRemoteRepository>(
        () => _i328.ReferanceRemoteRepository(
              gh<_i571.ReferanceDataSource>(),
              gh<_i982.AuthLocalRepository>(),
            ));
    gh.factory<_i562.RegisterRepository>(() => _i562.RegisterRepository(
          gh<_i1009.RegisterDataSource>(),
          gh<_i937.LoginLocalRepository>(),
        ));
    gh.factory<_i228.AdminRemoteRepository>(() => _i228.AdminRemoteRepository(
          gh<_i807.AdminDataSource>(),
          gh<_i982.AuthLocalRepository>(),
        ));
    gh.factory<_i702.ReminderRepository>(() => _i702.ReminderRepository(
          gh<_i856.DrinkReminderDataSource>(),
          gh<_i982.AuthLocalRepository>(),
        ));
    gh.factory<_i857.ForgotpasswordRemoteRepository>(
        () => _i857.ForgotpasswordRemoteRepository(
              gh<_i705.ForgotPasswordDataSource>(),
              gh<_i235.InformationLocalRepository>(),
            ));
    gh.factory<_i482.ChangePasswordRepository>(
        () => _i482.ChangePasswordRepository(
              gh<_i729.ChangePasswordDataSource>(),
              gh<_i982.AuthLocalRepository>(),
            ));
    gh.factory<_i793.LoginRepository>(() => _i793.LoginRepository(
          gh<_i152.LoginDataSource>(),
          gh<_i937.LoginLocalRepository>(),
          gh<_i235.InformationLocalRepository>(),
          gh<_i1059.PointRemoteRepository>(),
        ));
    gh.factory<_i481.AuthRepository>(() => _i481.AuthRepository(
          gh<_i528.AuthDataSource>(),
          gh<_i982.AuthLocalRepository>(),
        ));
    gh.factory<_i277.InformationRemoteRepository>(
        () => _i277.InformationRemoteRepository(
              gh<_i845.InformationDataSource>(),
              gh<_i982.AuthLocalRepository>(),
              gh<_i235.InformationLocalRepository>(),
            ));
    return this;
  }
}

class _$DatabaseModule extends _i484.DatabaseModule {}

class _$RouterModule extends _i825.RouterModule {}

class _$NetworkModule extends _i664.NetworkModule {}

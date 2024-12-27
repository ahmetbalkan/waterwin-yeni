import 'package:injectable/injectable.dart';
import 'package:waterwin_app/core/local_database/app_database.dart';
import 'package:waterwin_app/presentations/account_page/data/local/profit_data_dao.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/data/data_source/local/auth_dao.dart';
import 'package:waterwin_app/presentations/home_page/data/local/ad_dao.dart';
import 'package:waterwin_app/presentations/information_page/data/data_source/local/information_dao.dart';
import 'package:waterwin_app/presentations/point_page/data/local/points_dao.dart';

// Migrations are defined in app_database.dart

@module
abstract class DatabaseModule {
  @preResolve
  Future<AppDatabase> provideDatabase() async {
    return await $FloorAppDatabase
        .databaseBuilder('app_database.db')
        .addMigrations([
      migration6to7,
      migration7to8,
      migration8to9,
      migration9to10, // Correctly referenced
      migration10to11,
    ]).build();
  }

  AuthDao provideAuthDao(AppDatabase db) => db.authDao;
  InformationDao provideInformationDao(AppDatabase db) => db.informationDao;
  PointDao providePointDao(AppDatabase db) => db.pointDao;
  ProfitDao provideProfitDao(AppDatabase db) => db.profitDao;
  AdDao provideAdDao(AppDatabase db) => db.adDao;
}

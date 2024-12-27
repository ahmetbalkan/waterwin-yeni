import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:waterwin_app/presentations/account_page/data/local/profit_data_dao.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/profit_data_model.dart';
import 'package:waterwin_app/presentations/account_page/domain/model/profit_statistic_model.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/data/data_source/local/auth_dao.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/model/auth_response_model.dart';
import 'package:waterwin_app/presentations/home_page/data/local/ad_dao.dart';
import 'package:waterwin_app/presentations/home_page/domain/model/ad_local_model.dart';
import 'package:waterwin_app/presentations/information_page/data/data_source/local/information_dao.dart';
import 'package:waterwin_app/presentations/information_page/domain/model/information_model.dart';
import 'package:waterwin_app/presentations/point_page/data/local/points_dao.dart';
import 'package:waterwin_app/presentations/point_page/domain/model/point_model.dart';

part 'app_database.g.dart';

@Database(
  version: 11, // Incremented version number
  entities: [
    AuthResponseModel,
    InformationModel,
    PointResponseModel,
    ProfitDataModel,
    ProfitStatisticModel,
    AdModel,
  ],
)
abstract class AppDatabase extends FloorDatabase {
  AuthDao get authDao;
  InformationDao get informationDao;
  PointDao get pointDao;
  ProfitDao get profitDao;
  AdDao get adDao;
}

// Migrations
final migration6to7 = Migration(6, 7, (database) async {
  await database.execute('ALTER TABLE points ADD COLUMN pointType INTEGER');
});

final migration7to8 = Migration(7, 8, (database) async {
  // Include any changes between versions 7 and 8 if applicable
});

final migration8to9 = Migration(8, 9, (database) async {
  // Create new tables for profit_data and profit_list
  await database.execute('''
    CREATE TABLE IF NOT EXISTS `profit_data` (
      `id` INTEGER PRIMARY KEY NOT NULL,
      `normalTotal` REAL NOT NULL,
      `referenceTotal` REAL NOT NULL,
      `refreshDate` TEXT
    )
  ''');

  await database.execute('''
    CREATE TABLE IF NOT EXISTS `profit_list` (
      `id` INTEGER PRIMARY KEY AUTOINCREMENT,
      `profitDataId` INTEGER NOT NULL,
      `profitMonth` INTEGER NOT NULL,
      `profitYear` INTEGER NOT NULL,
      `totalPoints` REAL NOT NULL,
      `monthlyTotal` REAL NOT NULL,
      `refTotalPoints` REAL NOT NULL,
      `referanceTotal` REAL NOT NULL,
      FOREIGN KEY (`profitDataId`) REFERENCES `profit_data` (`id`) ON DELETE CASCADE
    )
  ''');
});

final migration9to10 = Migration(9, 10, (database) async {
  await database.execute('''
    CREATE TABLE IF NOT EXISTS `AdModel` (
      `id` INTEGER PRIMARY KEY NOT NULL,
      `name` TEXT NOT NULL,
      `lastSeenDate` TEXT NOT NULL
    )
  ''');
});

final migration10to11 = Migration(10, 11, (database) async {
  await database.execute('''
    CREATE TABLE IF NOT EXISTS `profit_statistics` (
      `id` INTEGER PRIMARY KEY AUTOINCREMENT,
      `profitDataId` INTEGER,
      `profitMonth` INTEGER NOT NULL,
      `profitYear` INTEGER NOT NULL,
      `totalPoints` TEXT NOT NULL,
      `monthlyTotal` REAL NOT NULL,
      `refTotalPoints` TEXT NOT NULL,
      `referanceTotal` REAL NOT NULL,
      FOREIGN KEY (`profitDataId`) REFERENCES `profit_data` (`id`) ON DELETE CASCADE
    )
  ''');
});

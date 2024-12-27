// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AuthDao? _authDaoInstance;

  InformationDao? _informationDaoInstance;

  PointDao? _pointDaoInstance;

  ProfitDao? _profitDaoInstance;

  AdDao? _adDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 11,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `userdata` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `token` TEXT, `refreshToken` TEXT, `userId` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `information` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `refId` TEXT, `userId` INTEGER, `gender` INTEGER, `height` INTEGER, `weight` INTEGER, `age` INTEGER, `sleepTime` TEXT, `wakeUpTime` TEXT, `activityLevel` INTEGER, `weatherCondition` INTEGER, `dailyGoal` INTEGER, `phoneNumber` TEXT, `createdAt` TEXT, `updatedAt` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `points` (`id` INTEGER NOT NULL, `userId` INTEGER, `glasstype` INTEGER, `wateramount` INTEGER, `adsId` INTEGER, `status` INTEGER, `pointType` INTEGER, `createdAt` TEXT, `updatedAt` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `profit_data` (`id` INTEGER NOT NULL, `normalTotal` REAL, `referenceTotal` REAL, `refreshDate` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `profit_statistics` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `profitDataId` INTEGER, `profitMonth` INTEGER NOT NULL, `profitYear` INTEGER NOT NULL, `totalPoints` TEXT NOT NULL, `monthlyTotal` REAL NOT NULL, `refTotalPoints` TEXT NOT NULL, `referanceTotal` REAL NOT NULL, FOREIGN KEY (`profitDataId`) REFERENCES `profit_data` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AdModel` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `lastSeenDate` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AuthDao get authDao {
    return _authDaoInstance ??= _$AuthDao(database, changeListener);
  }

  @override
  InformationDao get informationDao {
    return _informationDaoInstance ??=
        _$InformationDao(database, changeListener);
  }

  @override
  PointDao get pointDao {
    return _pointDaoInstance ??= _$PointDao(database, changeListener);
  }

  @override
  ProfitDao get profitDao {
    return _profitDaoInstance ??= _$ProfitDao(database, changeListener);
  }

  @override
  AdDao get adDao {
    return _adDaoInstance ??= _$AdDao(database, changeListener);
  }
}

class _$AuthDao extends AuthDao {
  _$AuthDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _authResponseModelInsertionAdapter = InsertionAdapter(
            database,
            'userdata',
            (AuthResponseModel item) => <String, Object?>{
                  'id': item.id,
                  'token': item.token,
                  'refreshToken': item.refreshToken,
                  'userId': item.userId
                }),
        _authResponseModelUpdateAdapter = UpdateAdapter(
            database,
            'userdata',
            ['id'],
            (AuthResponseModel item) => <String, Object?>{
                  'id': item.id,
                  'token': item.token,
                  'refreshToken': item.refreshToken,
                  'userId': item.userId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AuthResponseModel> _authResponseModelInsertionAdapter;

  final UpdateAdapter<AuthResponseModel> _authResponseModelUpdateAdapter;

  @override
  Future<AuthResponseModel?> getFirstAuth() async {
    return _queryAdapter.query('SELECT * FROM userdata LIMIT 1',
        mapper: (Map<String, Object?> row) => AuthResponseModel(
            id: row['id'] as int?,
            token: row['token'] as String?,
            refreshToken: row['refreshToken'] as String?,
            userId: row['userId'] as int?));
  }

  @override
  Future<void> clearAuthData() async {
    await _queryAdapter.queryNoReturn('DELETE FROM userdata');
  }

  @override
  Future<void> insertAuth(AuthResponseModel loginResponseModel) async {
    await _authResponseModelInsertionAdapter.insert(
        loginResponseModel, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateAuth(AuthResponseModel loginResponseModel) async {
    await _authResponseModelUpdateAdapter.update(
        loginResponseModel, OnConflictStrategy.replace);
  }
}

class _$InformationDao extends InformationDao {
  _$InformationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _informationModelInsertionAdapter = InsertionAdapter(
            database,
            'information',
            (InformationModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'refId': item.refId,
                  'userId': item.userId,
                  'gender': item.gender,
                  'height': item.height,
                  'weight': item.weight,
                  'age': item.age,
                  'sleepTime': item.sleepTime,
                  'wakeUpTime': item.wakeUpTime,
                  'activityLevel': item.activityLevel,
                  'weatherCondition': item.weatherCondition,
                  'dailyGoal': item.dailyGoal,
                  'phoneNumber': item.phoneNumber,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                },
            changeListener),
        _informationModelUpdateAdapter = UpdateAdapter(
            database,
            'information',
            ['id'],
            (InformationModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'refId': item.refId,
                  'userId': item.userId,
                  'gender': item.gender,
                  'height': item.height,
                  'weight': item.weight,
                  'age': item.age,
                  'sleepTime': item.sleepTime,
                  'wakeUpTime': item.wakeUpTime,
                  'activityLevel': item.activityLevel,
                  'weatherCondition': item.weatherCondition,
                  'dailyGoal': item.dailyGoal,
                  'phoneNumber': item.phoneNumber,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<InformationModel> _informationModelInsertionAdapter;

  final UpdateAdapter<InformationModel> _informationModelUpdateAdapter;

  @override
  Future<InformationModel?> getFirstInformation() async {
    return _queryAdapter.query('SELECT * FROM information LIMIT 1',
        mapper: (Map<String, Object?> row) => InformationModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            refId: row['refId'] as String?,
            userId: row['userId'] as int?,
            gender: row['gender'] as int?,
            height: row['height'] as int?,
            weight: row['weight'] as int?,
            age: row['age'] as int?,
            sleepTime: row['sleepTime'] as String?,
            wakeUpTime: row['wakeUpTime'] as String?,
            activityLevel: row['activityLevel'] as int?,
            weatherCondition: row['weatherCondition'] as int?,
            dailyGoal: row['dailyGoal'] as int?,
            phoneNumber: row['phoneNumber'] as String?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?));
  }

  @override
  Future<void> clearInformationData() async {
    await _queryAdapter.queryNoReturn('DELETE FROM information');
  }

  @override
  Stream<InformationModel?> watchInformation() {
    return _queryAdapter.queryStream('SELECT * FROM information LIMIT 1',
        mapper: (Map<String, Object?> row) => InformationModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            refId: row['refId'] as String?,
            userId: row['userId'] as int?,
            gender: row['gender'] as int?,
            height: row['height'] as int?,
            weight: row['weight'] as int?,
            age: row['age'] as int?,
            sleepTime: row['sleepTime'] as String?,
            wakeUpTime: row['wakeUpTime'] as String?,
            activityLevel: row['activityLevel'] as int?,
            weatherCondition: row['weatherCondition'] as int?,
            dailyGoal: row['dailyGoal'] as int?,
            phoneNumber: row['phoneNumber'] as String?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?),
        queryableName: 'information',
        isView: false);
  }

  @override
  Future<void> insertInformation(InformationModel loginResponseModel) async {
    await _informationModelInsertionAdapter.insert(
        loginResponseModel, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateInformation(InformationModel informationModel) async {
    await _informationModelUpdateAdapter.update(
        informationModel, OnConflictStrategy.replace);
  }
}

class _$PointDao extends PointDao {
  _$PointDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _pointResponseModelInsertionAdapter = InsertionAdapter(
            database,
            'points',
            (PointResponseModel item) => <String, Object?>{
                  'id': item.id,
                  'userId': item.userId,
                  'glasstype': item.glasstype,
                  'wateramount': item.wateramount,
                  'adsId': item.adsId,
                  'status': item.status,
                  'pointType': item.pointType,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PointResponseModel>
      _pointResponseModelInsertionAdapter;

  @override
  Future<void> clearAllPoints() async {
    await _queryAdapter.queryNoReturn('DELETE FROM points');
  }

  @override
  Stream<List<PointResponseModel>> watchAllPoints() {
    return _queryAdapter.queryListStream('SELECT * FROM points',
        mapper: (Map<String, Object?> row) => PointResponseModel(
            id: row['id'] as int,
            userId: row['userId'] as int?,
            glasstype: row['glasstype'] as int?,
            wateramount: row['wateramount'] as int?,
            adsId: row['adsId'] as int?,
            status: row['status'] as int?,
            pointType: row['pointType'] as int?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?),
        queryableName: 'points',
        isView: false);
  }

  @override
  Stream<List<PointResponseModel>> watchPointsWithPagination(
    int limit,
    int offset,
  ) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM points ORDER BY createdAt DESC LIMIT ?1 OFFSET ?2',
        mapper: (Map<String, Object?> row) => PointResponseModel(
            id: row['id'] as int,
            userId: row['userId'] as int?,
            glasstype: row['glasstype'] as int?,
            wateramount: row['wateramount'] as int?,
            adsId: row['adsId'] as int?,
            status: row['status'] as int?,
            pointType: row['pointType'] as int?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?),
        arguments: [limit, offset],
        queryableName: 'points',
        isView: false);
  }

  @override
  Stream<List<PointResponseModel>> watchPointsFromDate(String date) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM points WHERE DATE(createdAt) == DATE(?1) ORDER BY createdAt DESC',
        mapper: (Map<String, Object?> row) => PointResponseModel(
            id: row['id'] as int,
            userId: row['userId'] as int?,
            glasstype: row['glasstype'] as int?,
            wateramount: row['wateramount'] as int?,
            adsId: row['adsId'] as int?,
            status: row['status'] as int?,
            pointType: row['pointType'] as int?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?),
        arguments: [date],
        queryableName: 'points',
        isView: false);
  }

  @override
  Future<List<PointResponseModel>> getPointsFromDate(String date) async {
    return _queryAdapter.queryList(
        'SELECT * FROM points WHERE DATE(createdAt) = DATE(?1) ORDER BY createdAt DESC',
        mapper: (Map<String, Object?> row) => PointResponseModel(id: row['id'] as int, userId: row['userId'] as int?, glasstype: row['glasstype'] as int?, wateramount: row['wateramount'] as int?, adsId: row['adsId'] as int?, status: row['status'] as int?, pointType: row['pointType'] as int?, createdAt: row['createdAt'] as String?, updatedAt: row['updatedAt'] as String?),
        arguments: [date]);
  }

  @override
  Stream<List<PointResponseModel>> watchPointsFromDatePagination(
    String date,
    int limit,
    int offset,
  ) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM points WHERE DATE(createdAt) == DATE(?1) LIMIT ?2 OFFSET ?3',
        mapper: (Map<String, Object?> row) => PointResponseModel(
            id: row['id'] as int,
            userId: row['userId'] as int?,
            glasstype: row['glasstype'] as int?,
            wateramount: row['wateramount'] as int?,
            adsId: row['adsId'] as int?,
            status: row['status'] as int?,
            pointType: row['pointType'] as int?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?),
        arguments: [date, limit, offset],
        queryableName: 'points',
        isView: false);
  }

  @override
  Stream<List<PointResponseModel>> watchPointsForDateRange(
    String startDate,
    String endDate,
  ) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM points WHERE DATE(createdAt) BETWEEN DATE(?1) AND DATE(?2)',
        mapper: (Map<String, Object?> row) => PointResponseModel(
            id: row['id'] as int,
            userId: row['userId'] as int?,
            glasstype: row['glasstype'] as int?,
            wateramount: row['wateramount'] as int?,
            adsId: row['adsId'] as int?,
            status: row['status'] as int?,
            pointType: row['pointType'] as int?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?),
        arguments: [startDate, endDate],
        queryableName: 'points',
        isView: false);
  }

  @override
  Stream<int?> watchTotalWaterAmountForDate(String date) {
    return _queryAdapter.queryStream(
        'SELECT COALESCE(SUM(wateramount), 0) FROM points WHERE DATE(createdAt) == DATE(?1)',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [date],
        queryableName: 'points',
        isView: false);
  }

  @override
  Stream<int?> watchTotalWaterAmountForAllTime() {
    return _queryAdapter.queryStream('SELECT SUM(wateramount) FROM points',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        queryableName: 'points',
        isView: false);
  }

  @override
  Stream<List<PointResponseModel>> watchCurrentWeekPoints(
    String startOfWeek,
    String endOfWeek,
  ) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM points WHERE DATE(createdAt) BETWEEN DATE(?1) AND DATE(?2)',
        mapper: (Map<String, Object?> row) => PointResponseModel(
            id: row['id'] as int,
            userId: row['userId'] as int?,
            glasstype: row['glasstype'] as int?,
            wateramount: row['wateramount'] as int?,
            adsId: row['adsId'] as int?,
            status: row['status'] as int?,
            pointType: row['pointType'] as int?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?),
        arguments: [startOfWeek, endOfWeek],
        queryableName: 'points',
        isView: false);
  }

  @override
  Future<List<PointResponseModel>> getCurrentWeekPoints(
    String startOfWeek,
    String endOfWeek,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM points WHERE DATE(createdAt) BETWEEN DATE(?1) AND DATE(?2)',
        mapper: (Map<String, Object?> row) => PointResponseModel(id: row['id'] as int, userId: row['userId'] as int?, glasstype: row['glasstype'] as int?, wateramount: row['wateramount'] as int?, adsId: row['adsId'] as int?, status: row['status'] as int?, pointType: row['pointType'] as int?, createdAt: row['createdAt'] as String?, updatedAt: row['updatedAt'] as String?),
        arguments: [startOfWeek, endOfWeek]);
  }

  @override
  Stream<List<PointResponseModel>> watchCurrentMonthPoints(
    String startOfMonth,
    String endOfMonth,
  ) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM points WHERE DATE(createdAt) BETWEEN DATE(?1) AND DATE(?2)',
        mapper: (Map<String, Object?> row) => PointResponseModel(
            id: row['id'] as int,
            userId: row['userId'] as int?,
            glasstype: row['glasstype'] as int?,
            wateramount: row['wateramount'] as int?,
            adsId: row['adsId'] as int?,
            status: row['status'] as int?,
            pointType: row['pointType'] as int?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?),
        arguments: [startOfMonth, endOfMonth],
        queryableName: 'points',
        isView: false);
  }

  @override
  Future<List<PointResponseModel>> getCurrentMonthPoints(
    String startOfMonth,
    String endOfMonth,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM points WHERE DATE(createdAt) BETWEEN DATE(?1) AND DATE(?2)',
        mapper: (Map<String, Object?> row) => PointResponseModel(id: row['id'] as int, userId: row['userId'] as int?, glasstype: row['glasstype'] as int?, wateramount: row['wateramount'] as int?, adsId: row['adsId'] as int?, status: row['status'] as int?, pointType: row['pointType'] as int?, createdAt: row['createdAt'] as String?, updatedAt: row['updatedAt'] as String?),
        arguments: [startOfMonth, endOfMonth]);
  }

  @override
  Future<String?> getFirstDataDate() async {
    return _queryAdapter.query(
        'SELECT createdAt FROM points ORDER BY createdAt ASC LIMIT 1',
        mapper: (Map<String, Object?> row) => row.values.first as String);
  }

  @override
  Future<String?> getLastDataDate() async {
    return _queryAdapter.query(
        'SELECT createdAt FROM points ORDER BY createdAt DESC LIMIT 1',
        mapper: (Map<String, Object?> row) => row.values.first as String);
  }

  @override
  Future<void> insertPoint(PointResponseModel point) async {
    await _pointResponseModelInsertionAdapter.insert(
        point, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertPoints(List<PointResponseModel> points) async {
    await _pointResponseModelInsertionAdapter.insertList(
        points, OnConflictStrategy.replace);
  }
}

class _$ProfitDao extends ProfitDao {
  _$ProfitDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _profitDataModelInsertionAdapter = InsertionAdapter(
            database,
            'profit_data',
            (ProfitDataModel item) => <String, Object?>{
                  'id': item.id,
                  'normalTotal': item.normalTotal,
                  'referenceTotal': item.referenceTotal,
                  'refreshDate': item.refreshDate
                }),
        _profitStatisticModelInsertionAdapter = InsertionAdapter(
            database,
            'profit_statistics',
            (ProfitStatisticModel item) => <String, Object?>{
                  'id': item.id,
                  'profitDataId': item.profitDataId,
                  'profitMonth': item.profitMonth,
                  'profitYear': item.profitYear,
                  'totalPoints': item.totalPoints,
                  'monthlyTotal': item.monthlyTotal,
                  'refTotalPoints': item.refTotalPoints,
                  'referanceTotal': item.referanceTotal
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProfitDataModel> _profitDataModelInsertionAdapter;

  final InsertionAdapter<ProfitStatisticModel>
      _profitStatisticModelInsertionAdapter;

  @override
  Future<void> clearAllProfitData() async {
    await _queryAdapter.queryNoReturn('DELETE FROM profit_data');
  }

  @override
  Future<void> clearAllProfitStatistics() async {
    await _queryAdapter.queryNoReturn('DELETE FROM profit_statistics');
  }

  @override
  Future<ProfitDataModel?> getProfitData() async {
    return _queryAdapter.query('SELECT * FROM profit_data LIMIT 1',
        mapper: (Map<String, Object?> row) => ProfitDataModel(
            id: row['id'] as int,
            normalTotal: row['normalTotal'] as double?,
            referenceTotal: row['referenceTotal'] as double?,
            refreshDate: row['refreshDate'] as String?));
  }

  @override
  Future<List<ProfitStatisticModel>> getProfitStatistics(
      int profitDataId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM profit_statistics WHERE profitDataId = ?1',
        mapper: (Map<String, Object?> row) => ProfitStatisticModel(
            id: row['id'] as int?,
            profitDataId: row['profitDataId'] as int?,
            profitMonth: row['profitMonth'] as int,
            profitYear: row['profitYear'] as int,
            totalPoints: row['totalPoints'] as String,
            monthlyTotal: row['monthlyTotal'] as double,
            refTotalPoints: row['refTotalPoints'] as String,
            referanceTotal: row['referanceTotal'] as double),
        arguments: [profitDataId]);
  }

  @override
  Future<void> insertProfitData(ProfitDataModel profitData) async {
    await _profitDataModelInsertionAdapter.insert(
        profitData, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertProfitStatistics(
      List<ProfitStatisticModel> profitStatistics) async {
    await _profitStatisticModelInsertionAdapter.insertList(
        profitStatistics, OnConflictStrategy.replace);
  }

  @override
  Future<void> refreshProfitData(ProfitDataModel profitData) async {
    if (database is sqflite.Transaction) {
      await super.refreshProfitData(profitData);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.profitDao.refreshProfitData(profitData);
      });
    }
  }

  @override
  Future<void> refreshProfitStatistics(
      List<ProfitStatisticModel> profitStatistics) async {
    if (database is sqflite.Transaction) {
      await super.refreshProfitStatistics(profitStatistics);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.profitDao
            .refreshProfitStatistics(profitStatistics);
      });
    }
  }
}

class _$AdDao extends AdDao {
  _$AdDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _adModelInsertionAdapter = InsertionAdapter(
            database,
            'AdModel',
            (AdModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'lastSeenDate': _dateTimeConverter.encode(item.lastSeenDate)
                }),
        _adModelUpdateAdapter = UpdateAdapter(
            database,
            'AdModel',
            ['id'],
            (AdModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'lastSeenDate': _dateTimeConverter.encode(item.lastSeenDate)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AdModel> _adModelInsertionAdapter;

  final UpdateAdapter<AdModel> _adModelUpdateAdapter;

  @override
  Future<AdModel?> getAdById(int id) async {
    return _queryAdapter.query('SELECT * FROM AdModel WHERE id = ?1 LIMIT 1',
        mapper: (Map<String, Object?> row) => AdModel(
            id: row['id'] as int,
            name: row['name'] as String,
            lastSeenDate:
                _dateTimeConverter.decode(row['lastSeenDate'] as String)),
        arguments: [id]);
  }

  @override
  Future<AdModel?> getNextAdToShow() async {
    return _queryAdapter.query(
        'SELECT * FROM AdModel ORDER BY lastSeenDate ASC LIMIT 1',
        mapper: (Map<String, Object?> row) => AdModel(
            id: row['id'] as int,
            name: row['name'] as String,
            lastSeenDate:
                _dateTimeConverter.decode(row['lastSeenDate'] as String)));
  }

  @override
  Future<List<AdModel>> getAllAds() async {
    return _queryAdapter.queryList('SELECT * FROM AdModel',
        mapper: (Map<String, Object?> row) => AdModel(
            id: row['id'] as int,
            name: row['name'] as String,
            lastSeenDate:
                _dateTimeConverter.decode(row['lastSeenDate'] as String)));
  }

  @override
  Future<void> insertAd(AdModel ad) async {
    await _adModelInsertionAdapter.insert(ad, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateAd(AdModel ad) async {
    await _adModelUpdateAdapter.update(ad, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();

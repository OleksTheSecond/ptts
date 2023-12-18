// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
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

  PdfFileDao? _pdfFileDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
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
            'CREATE TABLE IF NOT EXISTS `pdf_file` (`name` TEXT NOT NULL, `path` TEXT NOT NULL, `currentPage` INTEGER NOT NULL, `isChoosed` INTEGER NOT NULL, PRIMARY KEY (`path`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PdfFileDao get pdfFileDao {
    return _pdfFileDaoInstance ??= _$PdfFileDao(database, changeListener);
  }
}

class _$PdfFileDao extends PdfFileDao {
  _$PdfFileDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _pdfFileModelInsertionAdapter = InsertionAdapter(
            database,
            'pdf_file',
            (PdfFileModel item) => <String, Object?>{
                  'name': item.name,
                  'path': item.path,
                  'currentPage': item.currentPage,
                  'isChoosed': item.isChoosed ? 1 : 0
                }),
        _pdfFileModelDeletionAdapter = DeletionAdapter(
            database,
            'pdf_file',
            ['path'],
            (PdfFileModel item) => <String, Object?>{
                  'name': item.name,
                  'path': item.path,
                  'currentPage': item.currentPage,
                  'isChoosed': item.isChoosed ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PdfFileModel> _pdfFileModelInsertionAdapter;

  final DeletionAdapter<PdfFileModel> _pdfFileModelDeletionAdapter;

  @override
  Future<List<PdfFileModel>> getPdfFiles() async {
    return _queryAdapter.queryList('SELECT * FROM pdf_file',
        mapper: (Map<String, Object?> row) => PdfFileModel(
            name: row['name'] as String,
            path: row['path'] as String,
            currentPage: row['currentPage'] as int,
            isChoosed: (row['isChoosed'] as int) != 0));
  }

  @override
  Future<void> insertPdfFile(PdfFileModel pdfFile) async {
    await _pdfFileModelInsertionAdapter.insert(
        pdfFile, OnConflictStrategy.replace);
  }

  @override
  Future<void> deletePdfFile(PdfFileModel pdfFile) async {
    await _pdfFileModelDeletionAdapter.delete(pdfFile);
  }
}

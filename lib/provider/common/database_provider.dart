import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();

  final databaseName = 'Simulator.db';
  final databaseVersion = 2;
  final migrations = [
    '''
  alter table skills add column deletedAt DateTime;
  '''
  ];

  static final DatabaseProvider instance = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    return _database ??= await initDatabase();
  }

  void _createTable(Batch batch) {
    batch.execute('''
    CREATE TABLE skills(
      id INTEGER PRIMARY KEY,
      skillName TEXT NOT NULL,
      maxLevel INTEGER NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL,
      deletedAt TEXT NOT NULL
    )
    ''');
  }

  Future<Database> initDatabase() async {
    final result =
    await openDatabase(join(await getDatabasesPath(), databaseName),
        version: databaseVersion,
        onCreate: (db, version) async {
          final batch = db.batch();
          _createTable(batch);
          await batch.commit();
        },
        onDowngrade: onDatabaseDowngradeDelete,
        onUpgrade: (db, oldVersion, newVersion) async {
          for (var i = oldVersion - 1; i <= newVersion - 1; i++) {
            await db.execute(migrations[i]);
          }
        });
    return result;
  }
}
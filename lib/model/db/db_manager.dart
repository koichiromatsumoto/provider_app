import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider_app/model/entity/skills.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBManager {
  // シングルトンクラス
  DBManager._privateConstructor();

  static final DBManager instance = DBManager._privateConstructor();

  // DBの作成
  static Database _database;

  static String _databaseName = "skill_simu.db";
  static int _databaseVersion = 1;

  Future<Database> get database async =>
      _database ??= await _initDatabase();

  _initDatabase() async {
    final Directory documentsDirectory =
    await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        var batch = db.batch();
        _onCreate(db, version);
        await batch.commit();
      },
      onDowngrade: onDatabaseDowngradeDelete,
    );
  }

  // DB作成時の処理
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE IF NOT EXISTS skills (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            skillName TEXT NOT NULL,
            maxLevel INTEGER NOT NULL,
            createdAt TEXT NOT NULL,
            updatedAt TEXT NOT NULL,
            selectedLevel INTEGER
          )
          ''');
    await db.execute('''
          CREATE TABLE IF NOT EXISTS gosekis (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            firstSlot INTEGER NOT NULL,
            secondSlot INTEGER NOT NULL,
            thirdSlot INTEGER NOT NULL,
            createdAt TEXT NOT NULL,
            updatedAt TEXT NOT NULL
          )
          ''');
    Skill.skills.forEach((skill) async {
      await db.insert("skills", toMap(skill));
    });
  }

  Map<String, dynamic> toMap(Skill skill) {
    return <String, dynamic>{
      'id': skill.id,
      'skillName': skill.skillName,
      'maxLevel': skill.maxLevel,
      'createdAt': skill.createdAt.toUtc().toIso8601String(),
      'updatedAt': skill.updatedAt.toUtc().toIso8601String(),
      'selectedLevel': skill.selectedLevel,
    };
  }

  // DBの削除
  void destroyDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, _databaseName);
    await deleteDatabase(path);
  }
}
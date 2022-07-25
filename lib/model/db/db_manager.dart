import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider_app/model/entity/skills.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../entity/gosekis.dart';

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
    final Directory documentsDirectory = await getApplicationDocumentsDirectory();
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

  String createSkillsSql = '''
    CREATE TABLE IF NOT EXISTS skills (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      skillId INTEGER NOT NULL,
      skillName TEXT NOT NULL,
      maxLevel INTEGER NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL,
      selectedLevel INTEGER
    )
  ''';

  String createGosekisSql = '''
    CREATE TABLE IF NOT EXISTS gosekis (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      firstSkillId INTEGER NOT NULL,
      firstSkillName TEXT NOT NULL,
      firstSkillLevel INTEGER NOT NULL,
      secondSkillId INTEGER,
      secondSkillName TEXT,
      secondSkillLevel INTEGER,
      firstSlot INTEGER NOT NULL,
      secondSlot INTEGER NOT NULL,
      thirdSlot INTEGER NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL
    )
  ''';

  String createArmorsSql = '''
    CREATE TABLE IF NOT EXISTS armors (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      armorId INTEGER NOT NULL,
      armorName TEXT NOT NULL,
      firstSkillId INTEGER,
      firstSkillName TEXT,
      firstSkillLevel INTEGER,
      secondSkillId INTEGER,
      secondSkillName TEXT,
      secondSkillLevel INTEGER,
      thirdSkillId INTEGER,
      thirdSkillName TEXT,
      thirdSkillLevel INTEGER,
      fourthSkillId INTEGER,
      fourthSkillName TEXT,
      fourthSkillLevel INTEGER,
      fifthSkillId INTEGER,
      fifthSkillName TEXT,
      fifthSkillLevel INTEGER,
      firstSlot INTEGER NOT NULL,
      secondSlot INTEGER NOT NULL,
      thirdSlot INTEGER NOT NULL,
      minDefensePower INTEGER,
      maxDefensePower INTEGER,
      part INTEGER,
      hyakuryuSlot INTEGER,
      fireResistance INTEGER,
      waterResistance INTEGER,
      lightningResistance INTEGER,
      iceResistance INTEGER,
      dragonResistance INTEGER,
      grade INTEGER,    
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL
    )
  ''';

  String createOrnamentsSql = '''
    CREATE TABLE IF NOT EXISTS ornaments (
      id INTEGER PRIMARY KEY NOT NULL,
      ornamentId INTEGER NOT NULL,
      ornamentName TEXT,
      firstSkillId INTEGER,
      firstSkillName TEXT,
      firstSkillLevel INTEGER,
      secondSkillId INTEGER,
      secondSkillName TEXT,
      secondSkillLevel INTEGER,
      slotSize INTEGER,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL
    )
  ''';

  // DB作成時の処理
  Future<void> _onCreate(Database db, int version) async {
    await db.execute(createSkillsSql);
    await db.execute(createGosekisSql);
    await db.execute(createArmorsSql);
    await db.execute(createOrnamentsSql);
    Goseki.gosekis.forEach((goseki) async {
      await db.insert("gosekis", toMapGoseki(goseki));
    });
  }

  Map<String, dynamic> toMapSkill(Skill skill) {
    return <String, dynamic>{
      'id': skill.id,
      'skillName': skill.skillName,
      'maxLevel': skill.maxLevel,
      'createdAt': DateTime.now().toUtc().toIso8601String(),
      'updatedAt': DateTime.now().toUtc().toIso8601String(),
      'selectedLevel': skill.selectedLevel,
    };
  }
  Map<String, dynamic> toMapGoseki(Goseki goseki) {
    return <String, dynamic>{
      'id': goseki.id,
      'firstSkillId': goseki.firstSkillId,
      'firstSkillName': goseki.firstSkillName,
      'firstSkillLevel': goseki.firstSkillLevel,
      'secondSkillId': goseki.secondSkillId,
      'secondSkillName': goseki.secondSkillName,
      'secondSkillLevel': goseki.secondSkillLevel,
      'firstSlot': goseki.firstSlot,
      'secondSlot': goseki.secondSlot,
      'thirdSlot': goseki.thirdSlot,
      'createdAt': DateTime.now().toUtc().toIso8601String(),
      'updatedAt': DateTime.now().toUtc().toIso8601String()
    };
  }

  // DBの削除
  void destroyDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, _databaseName);
    await deleteDatabase(path);
  }
}
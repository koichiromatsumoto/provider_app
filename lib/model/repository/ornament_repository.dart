import 'dart:async';

import '../db/db_manager.dart';
import '../entity/ornament.dart';

class OrnamentRepository {
  static String table = 'ornaments';
  static DBManager instance = DBManager.instance;

  static create(Ornament ornament) async {
    final db = await instance.database;
    await db.insert(table, ornament.toCreateMap());
  }

  static getAll() async {
    final db = await instance.database;
    var res = await db.rawQuery('SELECT * FROM $table ORDER BY id DESC');
    List<Ornament> list =
    res.isNotEmpty ? res.map((c) => Ornament.fromMap(c)).toList() : [];
    return list;
  }

  static getBySkill(int skillId) async {
    final db = await instance.database;
    var res = await db.rawQuery('SELECT * FROM $table WHERE firstSkillId = $skillId OR secondSkillId = $skillId ORDER BY maxDefensePower DESC');
    List<Ornament> list =
    res.isNotEmpty ? res.map((c) => Ornament.fromMap(c)).toList() : [];
    return list;
  }

  static update(Ornament ornament) async {
    final db = await instance.database;
    var res = await db.update(
        table,
        ornament.toUpdateMap(),
        where: "id = ?",
        whereArgs: [ornament.id]
    );
    return res;
  }

  static void delete(int id) async {
    final db = await instance.database;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Ornament>> updateFromApi(List<Ornament> ornaments) async {
    final db = await instance.database;
    await db.delete(table);
    for (Ornament ornament in ornaments) {
      await db.insert(table, ornament.toCreateMap());
    }
    var res = await db.rawQuery('SELECT * FROM $table ORDER BY id DESC');
    List<Ornament> list =
    res.isNotEmpty ? res.map((c) => Ornament.fromMap(c)).toList() : [];
    return list;
  }
}
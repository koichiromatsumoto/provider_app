import 'dart:async';

import '../db/db_manager.dart';
import '../entity/armors.dart';

class ArmorRepository {
  static String table = 'armors';
  static DBManager instance = DBManager.instance;

  static create(Armor armor) async {
    final db = await instance.database;
    await db.insert(table, armor.toCreateMap());
  }

  static getAll() async {
    final db = await instance.database;
    var res = await db.rawQuery('SELECT * FROM $table ORDER BY id DESC');
    List<Armor> list =
    res.isNotEmpty ? res.map((c) => Armor.fromMap(c)).toList() : [];
    return list;
  }

  static getBySkill(int skillId) async {
    final db = await instance.database;
    var res = await db.rawQuery('SELECT * FROM $table WHERE firstSkillId = $skillId OR secondSkillId = $skillId OR thirdSkillId = $skillId OR fourthSkillId = $skillId OR fifthSkillId = $skillId ORDER BY maxDefensePower DESC');
    List<Armor> list =
    res.isNotEmpty ? res.map((c) => Armor.fromMap(c)).toList() : [];
    return list;
  }

  static update(Armor armor) async {
    final db = await instance.database;
    var res = await db.update(
        table,
        armor.toUpdateMap(),
        where: "id = ?",
        whereArgs: [armor.id]
    );
    return res;
  }

  static void delete(int id) async {
    final db = await instance.database;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Armor>> updateFromApi(List<Armor> armors) async {
    final db = await instance.database;
    await db.delete(table);
    for (Armor armor in armors) {
      await db.insert(table, armor.toCreateMap());
    }
    var res = await db.rawQuery('SELECT * FROM $table ORDER BY id DESC');
    List<Armor> list =
    res.isNotEmpty ? res.map((c) => Armor.fromMap(c)).toList() : [];
    return list;
  }
}
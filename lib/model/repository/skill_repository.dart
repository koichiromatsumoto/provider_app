import 'dart:async';

import '../db/db_manager.dart';
import '../entity/skills.dart';

class SkillRepository {
  static String table = 'skills';
  static DBManager instance = DBManager.instance;

  static create(Skill skill) async {
    final db = await instance.database;
    await db.insert(table, skill.toCreateMap());
  }

  static getAll() async {
    final db = await instance.database;
    var res = await db.rawQuery('SELECT * FROM $table ORDER BY id ASC');
    List<Skill> list =
    res.isNotEmpty ? res.map((c) => Skill.fromMap(c)).toList() : [];
    return list;
  }

  static getById(int id) async {
    final db = await instance.database;
    var res = await db.rawQuery('SELECT * FROM $table WHERE id = $id ORDER BY id ASC');
    Skill skill =
    res.isNotEmpty ? res.map((c) => Skill.fromMap(c)).toList()[0] : [];
    return skill;
  }

  static update(Skill skill) async {
    final db = await instance.database;
    var res = await db.update(
        table,
        skill.toUpdateMap(),
        where: "id = ?",
        whereArgs: [skill.id]
    );
    return res;
  }

  static void delete(int id) async {
    final db = await instance.database;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
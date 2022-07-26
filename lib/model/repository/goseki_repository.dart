import 'dart:async';

import '../db/db_manager.dart';
import '../entity/gosekis.dart';

class GosekiRepository {
  static String table = 'gosekis';
  static DBManager instance = DBManager.instance;

  static create(Goseki goseki) async {
    final db = await instance.database;
    await db.insert(table, goseki.toCreateMap());
  }

  static getAll() async {
    final db = await instance.database;
    var res = await db.rawQuery('SELECT * FROM $table ORDER BY id DESC');
    List<Goseki> list =
    res.isNotEmpty ? res.map((c) => Goseki.fromMap(c)).toList() : [];
    return list;
  }

  static getById(int id) async {
    final db = await instance.database;
    var res = await db.rawQuery('SELECT * FROM $table WHERE id = $id ORDER BY id ASC');
    Goseki goseki =
    res.isNotEmpty ? res.map((c) => Goseki.fromMap(c)).toList()[0] : [];
    return goseki;
  }

  static update(Goseki goseki) async {
    final db = await instance.database;
    var res = await db.update(
        table,
        goseki.toUpdateMap(),
        where: "id = ?",
        whereArgs: [goseki.id]
    );
    return res;
  }

  static void delete(int id) async {
    final db = await instance.database;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
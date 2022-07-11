import 'package:flutter/material.dart';
import 'package:provider_app/model/repository/skill_repository.dart';
import 'package:provider_app/model/entity/skills.dart';
import 'package:provider_app/provider/common/database_provider.dart';

class SkillRepositoryImpl implements SkillRepository {
  static String table = 'skills';
  static DatabaseProvider instance = DatabaseProvider.instance;

  @override
  Future<Skill> create({
    int id,
    String skillName,
    int maxLevel,
    DateTime now,
  }) async {
    final row = <String, dynamic>{
      'id': id,
      'skillName': skillName,
      'maxLevel': maxLevel,
      'createdAt': now.toString(),
      'updatedAt': now.toString(),
      'deletedAt': null,
    };
    final db = await instance.database;
    final skillId = await db.insert(table, row);
    return Skill(
      id: skillId,
      skillName: row['skillName'] as String,
      maxLevel: row['maxLevel'] as int,
      createdAt: now,
      updatedAt: now,
      deletedAt: null,
    );
  }

  @override
  Future<List<Skill>> findAll() async {
    final db = await instance.database;

    final rows = await db.rawQuery('SELECT * FROM $table ORDER BY skillName DESC');
    if (rows.isEmpty) {
      return [];
    } else {
      return rows.map((json) => Skill.fromMap(json)).toList();
    }
  }

  @override
  Future<Skill> find({int id}) async {
    final db = await instance.database;
    final rows =
    await db.rawQuery('SELECT * FROM $table WHERE id = ?', <int>[id]);
    if (rows.isEmpty) {
      return null;
    } else {
      return Skill.fromMap(rows.first);
    }
  }

  @override
  Future<void> delete({@required int id}) async {
    final db = await instance.database;
    await db.delete(table, where: 'id = ?', whereArgs: <int>[id]);
  }

  @override
  Future<void> update({@required Skill skill}) async {
    final row = {
      'id': skill.id,
      'skillName': skill.skillName,
      'maxLevel': skill.maxLevel,
      'updatedAt': skill.updatedAt.toString(),
    };
    final db = await instance.database;
    await db.update(table, row, where: 'id = ?', whereArgs: <int>[skill.id]);
  }
}
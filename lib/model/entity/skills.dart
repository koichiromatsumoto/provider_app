import 'package:flutter/cupertino.dart';

class Skill {

  final int id;
  final int skillId;
  String skillName;
  int maxLevel;
  final DateTime createdAt;
  DateTime updatedAt;
  int selectedLevel;

  Skill(
      {
        this.id,
        this.skillId,
        this.skillName,
        this.maxLevel,
        this.createdAt,
        this.updatedAt,
        this.selectedLevel
      }
  );

  factory Skill.fromMap(Map<String, dynamic> json) => Skill(
    id: json['id'] as int,
    skillId: json['skillId'] as int,
    skillName: json['skillName'] as String,
    maxLevel: json['maxLevel'] as int,
    createdAt: DateTime.parse(json['createdAt'] as String).toLocal(),
    updatedAt: DateTime.parse(json['updatedAt'] as String).toLocal(),
    selectedLevel: json['selectedLevel'] as int,
  );

  factory Skill.fromDataUpdateMap(Map<String, dynamic> json) => Skill(
    skillId: json['系統番号'] as int,
    skillName: json['#スキル系統'] as String,
    maxLevel: json['スキルレベル'] as int,
    createdAt: DateTime.parse(json['作成日'] as String).toLocal(),
    updatedAt: DateTime.parse(json['更新日'] as String).toLocal(),
    selectedLevel: null,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'skillId': skillId,
      'skillName': skillName,
      'maxLevel': maxLevel,
      'createdAt': createdAt.toUtc().toIso8601String(),
      'updatedAt': updatedAt.toUtc().toIso8601String(),
      'selectedLevel': selectedLevel,
    };
  }

  Map<String, dynamic> toCreateMap() {
    return <String, dynamic>{
      'id': id,
      'skillId': skillId,
      'skillName': skillName,
      'maxLevel': maxLevel,
      'createdAt': DateTime.now().toUtc().toIso8601String(),
      'updatedAt': DateTime.now().toUtc().toIso8601String(),
      'selectedLevel': null,
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return <String, dynamic>{
      'id': id,
      'skillId': skillId,
      'skillName': skillName,
      'maxLevel': maxLevel,
      'createdAt': createdAt,
      'updatedAt': DateTime.now().toUtc().toIso8601String(),
      'selectedLevel': selectedLevel,
    };
  }
}
import 'package:flutter/cupertino.dart';

class Skill {

  final int id;
  String skillName;
  int maxLevel;
  final DateTime createdAt;
  DateTime updatedAt;
  int selectedLevel;

  Skill(
      {
        this.id,
        this.skillName,
        this.maxLevel,
        this.createdAt,
        this.updatedAt,
        this.selectedLevel
      }
  );

  factory Skill.fromMap(Map<String, dynamic> json) => Skill(
    id: json['id'] as int,
    skillName: json['skillName'] as String,
    maxLevel: json['maxLevel'] as int,
    createdAt: DateTime.parse(json['createdAt'] as String).toLocal(),
    updatedAt: DateTime.parse(json['updatedAt'] as String).toLocal(),
    selectedLevel: json['selectedLevel'] as int,
  );

  // define getter
  int get getId => id;
  String get getSkillName => '$skillName';
  int get getMaxLevel => maxLevel;
  int get getSelectedLevel => selectedLevel;
  DateTime get getUpdatedAt => updatedAt;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
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
      'skillName': skillName,
      'maxLevel': maxLevel,
      'createdAt': createdAt,
      'updatedAt': DateTime.now().toUtc().toIso8601String(),
      'selectedLevel': selectedLevel,
    };
  }

  @override
  String toString() {
    return 'Skill{id: $id, skillName: $skillName, maxLevel: $maxLevel}';
  }

  static List<Skill> skills = [
    Skill(id: 1, skillName: "攻撃", maxLevel: 7, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 2, skillName: "防御", maxLevel: 7, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 3, skillName: "反動軽減", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 4, skillName: "気絶耐性", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 5, skillName: "ひるみ軽減", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 6, skillName: "回避距離UP", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 7, skillName: "回避性能", maxLevel: 5, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 8, skillName: "貫通弾・貫通矢強化", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 9, skillName: "通常弾・連射矢強化", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 10, skillName: "体力回復量UP", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 11, skillName: "KO術", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 12, skillName: "弱点特効", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 13, skillName: "速射強化", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 14, skillName: "装填速度", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 15, skillName: "装填拡張", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 16, skillName: "見切り", maxLevel: 7, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 17, skillName: "超会心", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 18, skillName: "弾丸節約", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 19, skillName: "弾導強化", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Skill(id: 20, skillName: "渾身", maxLevel: 3, createdAt: DateTime.now(), updatedAt: DateTime.now()),
  ];
}
import 'package:flutter/cupertino.dart';
import 'package:provider_app/constant/configs.dart';
import 'package:provider_app/model/repository/skill_repository.dart';

class Ornament {

  final int id;
  final int ornamentId;
  String ornamentName;
  int firstSkillId;
  String firstSkillName;
  int firstSkillLevel;
  int secondSkillId;
  String secondSkillName;
  int secondSkillLevel;
  int slotSize;
  final DateTime createdAt;
  DateTime updatedAt;

  Ornament(
      {
        this.id,
        this.ornamentId,
        this.ornamentName,
        this.firstSkillId,
        this.firstSkillName,
        this.firstSkillLevel,
        this.secondSkillId,
        this.secondSkillName,
        this.secondSkillLevel,
        this.slotSize,
        this.createdAt,
        this.updatedAt
      }
      );

  factory Ornament.fromMap(Map<String, dynamic> json) => Ornament(
      id: json['id'] as int,
      ornamentId: json['ornamentId'] as int,
      ornamentName: json['ornamentName'] as String,
      firstSkillId: json['firstSkillId'] as int,
      firstSkillName: json['firstSkillName'] as String,
      firstSkillLevel: json['firstSkillLevel'] as int,
      secondSkillId: json['secondSkillId'] as int,
      secondSkillName: json['secondSkillName'] as String,
      secondSkillLevel: json['secondSkillLevel'] as int,
      slotSize: json['slotSize'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String).toLocal(),
      updatedAt: DateTime.parse(json['updatedAt'] as String).toLocal()
  );

  factory Ornament.fromDataUpdateApiMap(Map<String, dynamic> json) => Ornament(
      ornamentId: json['ID'] as int,
      ornamentName: json['#名前'] as String,
      firstSkillId: json['スキル系統番号1'] as int,
      firstSkillName: json['スキル系統1'] as String,
      firstSkillLevel: json['スキル値1'] as int,
      secondSkillId: json['スキル系統番号2'] as int,
      secondSkillName: json['スキル系統2'] as String,
      secondSkillLevel: json['スキル値2'] as int,
      slotSize: json['スロットサイズ'] as int,
      createdAt: DateTime.parse(json['作成日'] as String).toLocal(),
      updatedAt: DateTime.parse(json['更新日'] as String).toLocal()
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ornamentId': ornamentId,
      'ornamentName': ornamentName,
      'firstSkillId': firstSkillId,
      'firstSkillName': firstSkillName,
      'firstSkillLevel': firstSkillLevel,
      'secondSkillId': secondSkillId,
      'secondSkillName': secondSkillName,
      'secondSkillLevel': secondSkillLevel,
      'slotSize': slotSize,
      'createdAt': createdAt.toUtc().toIso8601String(),
      'updatedAt': updatedAt.toUtc().toIso8601String()
    };
  }

  Map<String, dynamic> toCreateMap() {
    return <String, dynamic>{
      'id': id,
      'ornamentId': ornamentId,
      'ornamentName': ornamentName,
      'firstSkillId': firstSkillId,
      'firstSkillName': firstSkillName,
      'firstSkillLevel': firstSkillLevel,
      'secondSkillId': secondSkillId,
      'secondSkillName': secondSkillName,
      'secondSkillLevel': secondSkillLevel,
      'slotSize': slotSize,
      'createdAt': DateTime.now().toUtc().toIso8601String(),
      'updatedAt': DateTime.now().toUtc().toIso8601String()
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return <String, dynamic>{
      'id': id,
      'ornamentId': ornamentId,
      'ornamentName': ornamentName,
      'firstSkillId': firstSkillId,
      'firstSkillName': firstSkillName,
      'firstSkillLevel': firstSkillLevel,
      'secondSkillId': secondSkillId,
      'secondSkillName': secondSkillName,
      'secondSkillLevel': secondSkillLevel,
      'slotSize': slotSize,
      'createdAt': createdAt.toUtc().toIso8601String(),
      'updatedAt': DateTime.now().toUtc().toIso8601String()
    };
  }
}
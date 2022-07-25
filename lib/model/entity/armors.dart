import 'package:flutter/cupertino.dart';
import 'package:provider_app/constant/configs.dart';
import 'package:provider_app/model/repository/skill_repository.dart';

class Armor {

  final int id;
  final int armorId;
  String armorName;
  int firstSkillId;
  String firstSkillName;
  int firstSkillLevel;
  int secondSkillId;
  String secondSkillName;
  int secondSkillLevel;
  int thirdSkillId;
  String thirdSkillName;
  int thirdSkillLevel;
  int fourthSkillId;
  String fourthSkillName;
  int fourthSkillLevel;
  int fifthSkillId;
  String fifthSkillName;
  int fifthSkillLevel;
  int minDefensePower;
  int maxDefensePower;
  int part;
  int firstSlot;
  int secondSlot;
  int thirdSlot;
  int hyakuryuSlot;
  int fireResistance;
  int waterResistance;
  int lightningResistance;
  int iceResistance;
  int dragonResistance;
  int grade;
  final DateTime createdAt;
  DateTime updatedAt;

  Armor(
      {
        this.id,
        this.armorId,
        this.armorName,
        this.firstSkillId,
        this.firstSkillName,
        this.firstSkillLevel,
        this.secondSkillId,
        this.secondSkillName,
        this.secondSkillLevel,
        this.thirdSkillId,
        this.thirdSkillName,
        this.thirdSkillLevel,
        this.fourthSkillId,
        this.fourthSkillName,
        this.fourthSkillLevel,
        this.fifthSkillId,
        this.fifthSkillName,
        this.fifthSkillLevel,
        this.minDefensePower,
        this.maxDefensePower,
        this.part,
        this.firstSlot,
        this.secondSlot,
        this.thirdSlot,
        this.hyakuryuSlot,
        this.fireResistance,
        this.waterResistance,
        this.lightningResistance,
        this.iceResistance,
        this.dragonResistance,
        this.grade,
        this.createdAt,
        this.updatedAt
      }
      );

  factory Armor.fromMap(Map<String, dynamic> json) => Armor(
      id: json['id'] as int,
      armorId: json['armorId'] as int,
      armorName: json['armorName'] as String,
      firstSkillId: json['firstSkillId'] as int,
      firstSkillName: json['firstSkillName'] as String,
      firstSkillLevel: json['firstSkillLevel'] as int,
      secondSkillId: json['secondSkillId'] as int,
      secondSkillName: json['secondSkillName'] as String,
      secondSkillLevel: json['secondSkillLevel'] as int,
      thirdSkillId: json['thirdSkillId'] as int,
      thirdSkillName: json['thirdSkillName'] as String,
      thirdSkillLevel: json['thirdSkillLevel'] as int,
      fourthSkillId: json['fourthSkillId'] as int,
      fourthSkillName: json['fourthSkillName'] as String,
      fourthSkillLevel: json['fourthSkillLevel'] as int,
      fifthSkillId: json['fifthSkillId'] as int,
      fifthSkillName: json['fifthSkillName'] as String,
      fifthSkillLevel: json['fifthSkillLevel'] as int,
      minDefensePower: json['minDefensePower'] as int,
      maxDefensePower: json['maxDefensePower'] as int,
      part: json['part'] as int,
      firstSlot: json['firstSlot'] as int,
      secondSlot: json['secondSlot'] as int,
      thirdSlot: json['thirdSlot'] as int,
      hyakuryuSlot: json['hyakuryuSlot'] as int,
      fireResistance: json['fireResistance'] as int,
      waterResistance: json['waterResistance'] as int,
      lightningResistance: json['lightningResistance'] as int,
      iceResistance: json['iceResistance'] as int,
      dragonResistance: json['dragonResistance'] as int,
      grade: json['grade'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String).toLocal(),
      updatedAt: DateTime.parse(json['updatedAt'] as String).toLocal()
  );

  factory Armor.fromDataUpdateApiMap(Map<String, dynamic> json) => Armor(
      armorId: json['ID'] as int,
      armorName: json['#名前'] as String,
      firstSkillId: json['スキル系統番号1'] as int,
      firstSkillName: json['スキル系統1'] as String,
      firstSkillLevel: json['スキル値1'] as int,
      secondSkillId: json['スキル系統番号2'] as int,
      secondSkillName: json['スキル系統2'] as String,
      secondSkillLevel: json['スキル値2'] as int,
      thirdSkillId: json['スキル系統番号3'] as int,
      thirdSkillName: json['スキル系統3'] as String,
      thirdSkillLevel: json['スキル値2'] as int,
      fourthSkillId: json['スキル系統番号4'] as int,
      fourthSkillName: json['スキル系統4'] as String,
      fourthSkillLevel: json['スキル値4'] as int,
      fifthSkillId: json['スキル系統番号5'] as int,
      fifthSkillName: json['スキル系統4'] as String,
      fifthSkillLevel: json['スキル値5'] as int,
      minDefensePower: json['初期防御力'] as int,
      maxDefensePower: json['最終防御力'] as int,
      part: json['タイプ'] as int,
      firstSlot: json['スロット1'] as int,
      secondSlot: json['スロット2'] as int,
      thirdSlot: json['スロット3'] as int,
      hyakuryuSlot: json['百竜スロット1'] as int,
      fireResistance: json['火耐性'] as int,
      waterResistance: json['水耐性'] as int,
      lightningResistance: json['雷耐性'] as int,
      iceResistance: json['氷耐性'] as int,
      dragonResistance: json['龍耐性'] as int,
      grade: json['位'] as int,
      createdAt: DateTime.parse(json['作成日'] as String).toLocal(),
      updatedAt: DateTime.parse(json['更新日'] as String).toLocal()
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'armorId': armorId,
      'armorName': armorName,
      'firstSkillId': firstSkillId,
      'firstSkillName': firstSkillName,
      'firstSkillLevel': firstSkillLevel,
      'secondSkillId': secondSkillId,
      'secondSkillName': secondSkillName,
      'secondSkillLevel': secondSkillLevel,
      'thirdSkillId': thirdSkillId,
      'thirdSkillName': thirdSkillName,
      'thirdSkillLevel': thirdSkillLevel,
      'fourthSkillId': fourthSkillId,
      'fourthSkillName': fourthSkillName,
      'fourthSkillLevel': fourthSkillLevel,
      'fifthSkillId': fifthSkillId,
      'fifthSkillName': fifthSkillName,
      'fifthSkillLevel': fifthSkillLevel,
      'minDefensePower': minDefensePower,
      'maxDefensePower': maxDefensePower,
      'part': part,
      'firstSlot': firstSlot,
      'secondSlot': secondSlot,
      'thirdSlot': thirdSlot,
      'hyakuryuSlot': hyakuryuSlot,
      'fireResistance': fireResistance,
      'waterResistance': waterResistance,
      'lightningResistance': lightningResistance,
      'iceResistance': iceResistance,
      'dragonResistance': dragonResistance,
      'grade': grade,
      'createdAt': createdAt.toUtc().toIso8601String(),
      'updatedAt': updatedAt.toUtc().toIso8601String()
    };
  }

  Map<String, dynamic> toCreateMap() {
    List<int> slotList = [firstSlot, secondSlot, thirdSlot];
    slotList.sort((a, b) => b.compareTo(a));
    return <String, dynamic>{
      'id': id,
      'armorId': armorId,
      'armorName': armorName,
      'firstSkillId': firstSkillId,
      'firstSkillName': firstSkillName,
      'firstSkillLevel': firstSkillLevel,
      'secondSkillId': secondSkillId,
      'secondSkillName': secondSkillName,
      'secondSkillLevel': secondSkillLevel,
      'thirdSkillId': thirdSkillId,
      'thirdSkillName': thirdSkillName,
      'thirdSkillLevel': thirdSkillLevel,
      'fourthSkillId': fourthSkillId,
      'fourthSkillName': fourthSkillName,
      'fourthSkillLevel': fourthSkillLevel,
      'fifthSkillId': fifthSkillId,
      'fifthSkillName': fifthSkillName,
      'fifthSkillLevel': fifthSkillLevel,
      'minDefensePower': minDefensePower,
      'maxDefensePower': maxDefensePower,
      'part': part,
      'firstSlot': slotList[0],
      'secondSlot': slotList[1],
      'thirdSlot': slotList[2],
      'hyakuryuSlot': hyakuryuSlot,
      'fireResistance': fireResistance,
      'waterResistance': waterResistance,
      'lightningResistance': lightningResistance,
      'iceResistance': iceResistance,
      'dragonResistance': dragonResistance,
      'grade': grade,
      'createdAt': DateTime.now().toUtc().toIso8601String(),
      'updatedAt': DateTime.now().toUtc().toIso8601String()
    };
  }

  Map<String, dynamic> toUpdateMap() {
    List<int> slotList = [firstSlot, secondSlot, thirdSlot];
    slotList.sort((a, b) => b.compareTo(a));
    return <String, dynamic>{
      'id': id,
      'armorId': armorId,
      'armorName': armorName,
      'firstSkillId': firstSkillId,
      'firstSkillName': firstSkillName,
      'firstSkillLevel': firstSkillLevel,
      'secondSkillId': secondSkillId,
      'secondSkillName': secondSkillName,
      'secondSkillLevel': secondSkillLevel,
      'thirdSkillId': thirdSkillId,
      'thirdSkillName': thirdSkillName,
      'thirdSkillLevel': thirdSkillLevel,
      'fourthSkillId': fourthSkillId,
      'fourthSkillName': fourthSkillName,
      'fourthSkillLevel': fourthSkillLevel,
      'fifthSkillId': fifthSkillId,
      'fifthSkillName': fifthSkillName,
      'fifthSkillLevel': fifthSkillLevel,
      'minDefensePower': minDefensePower,
      'maxDefensePower': maxDefensePower,
      'part': part,
      'firstSlot': slotList[0],
      'secondSlot': slotList[1],
      'thirdSlot': slotList[2],
      'hyakuryuSlot': hyakuryuSlot,
      'fireResistance': fireResistance,
      'waterResistance': waterResistance,
      'lightningResistance': lightningResistance,
      'iceResistance': iceResistance,
      'dragonResistance': dragonResistance,
      'grade': grade,
      'createdAt': createdAt.toUtc().toIso8601String(),
      'updatedAt': DateTime.now().toUtc().toIso8601String()
    };
  }
}
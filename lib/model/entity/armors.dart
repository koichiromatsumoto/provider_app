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
      armorName: json['#??????'] as String,
      firstSkillId: json['?????????????????????1'] as int,
      firstSkillName: json['???????????????1'] as String,
      firstSkillLevel: json['????????????1'] as int,
      secondSkillId: json['?????????????????????2'] as int,
      secondSkillName: json['???????????????2'] as String,
      secondSkillLevel: json['????????????2'] as int,
      thirdSkillId: json['?????????????????????3'] as int,
      thirdSkillName: json['???????????????3'] as String,
      thirdSkillLevel: json['????????????2'] as int,
      fourthSkillId: json['?????????????????????4'] as int,
      fourthSkillName: json['???????????????4'] as String,
      fourthSkillLevel: json['????????????4'] as int,
      fifthSkillId: json['?????????????????????5'] as int,
      fifthSkillName: json['???????????????4'] as String,
      fifthSkillLevel: json['????????????5'] as int,
      minDefensePower: json['???????????????'] as int,
      maxDefensePower: json['???????????????'] as int,
      part: json['?????????'] as int,
      firstSlot: json['????????????1'] as int,
      secondSlot: json['????????????2'] as int,
      thirdSlot: json['????????????3'] as int,
      hyakuryuSlot: json['??????????????????1'] as int,
      fireResistance: json['?????????'] as int,
      waterResistance: json['?????????'] as int,
      lightningResistance: json['?????????'] as int,
      iceResistance: json['?????????'] as int,
      dragonResistance: json['?????????'] as int,
      grade: json['???'] as int,
      createdAt: DateTime.parse(json['?????????'] as String).toLocal(),
      updatedAt: DateTime.parse(json['?????????'] as String).toLocal()
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
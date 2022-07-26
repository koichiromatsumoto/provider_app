import 'dart:core';

import 'package:provider_app/model/repository/goseki_repository.dart';

import '../../../../model/entity/gosekis.dart';

class ResGoseki {
  final int gosekiId;
  final int firstSkillId;
  final String firstSkillName;
  final int firstSkillLevel;
  final int secondSkillId;
  final String secondSkillName;
  final int secondSkillLevel;
  final int thirdSkillId;
  final String thirdSkillName;
  final int thirdSkillLevel;
  final int firstSlot;
  final int secondSlot;
  final int thirdSlot;

  ResGoseki({
    this.gosekiId,
    this.firstSkillId,
    this.firstSkillName,
    this.firstSkillLevel,
    this.secondSkillId,
    this.secondSkillName,
    this.secondSkillLevel,
    this.thirdSkillId,
    this.thirdSkillName,
    this.thirdSkillLevel,
    this.firstSlot,
    this.secondSlot,
    this.thirdSlot,
  });

  factory ResGoseki.fromSimulateApiMap(Map<String, dynamic> json) => ResGoseki(
    gosekiId: json['gosekiId'] as int,
    firstSkillId: json['firstSkillId'] as int,
    firstSkillName: json['firstSkillName'] as String,
    firstSkillLevel: json['firstSkillLevel'] as int,
    secondSkillId: json['secondSkillId'] as int,
    secondSkillName: json['secondSkillName'] as String,
    secondSkillLevel: json['secondSkillLevel'] as int,
    thirdSkillId: json['thirdSkillId'] as int,
    thirdSkillName: json['thirdSkillName'] as String,
    thirdSkillLevel: json['thirdSkillLevel'] as int,
    firstSlot: json['firstSlot'] as int,
    secondSlot: json['secondSlot'] as int,
    thirdSlot: json['thirdSlot'] as int,
  );
}
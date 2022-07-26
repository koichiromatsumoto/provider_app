class ResArmorInfo {
  final int armorId;
  final String armorName;
  final int part;
  final int firstSkillId;
  final String firstSkillName;
  final int firstSkillLevel;
  final int secondSkillId;
  final String secondSkillName;
  final int secondSkillLevel;
  final int thirdSkillId;
  final String thirdSkillName;
  final int thirdSkillLevel;
  final int fourthSkillId;
  final String fourthSkillName;
  final int fourthSkillLevel;
  final int fifthSkillId;
  final String fifthSkillName;
  final int fifthSkillLevel;
  final int firstSlot;
  final int secondSlot;
  final int thirdSlot;
  final int minDefenseNum;
  final int maxDefenseNum;
  final int fireResistance;
  final int waterResistance;
  final int lightningResistance;
  final int iceResistance;
  final int dragonResistance;

  ResArmorInfo({
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
    this.minDefenseNum,
    this.maxDefenseNum,
    this.part,
    this.firstSlot,
    this.secondSlot,
    this.thirdSlot,
    this.fireResistance,
    this.waterResistance,
    this.lightningResistance,
    this.iceResistance,
    this.dragonResistance,
  });

  factory ResArmorInfo.fromSimulateApiMap(Map<String, dynamic> json) => ResArmorInfo(
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
    minDefenseNum: json['minDefenseNum'] as int,
    maxDefenseNum: json['maxDefenseNum'] as int,
    part: json['part'] as int,
    firstSlot: json['firstSlot'] as int,
    secondSlot: json['secondSlot'] as int,
    thirdSlot: json['thirdSlot'] as int,
    fireResistance: json['fireResistance'] as int,
    waterResistance: json['waterResistance'] as int,
    lightningResistance: json['lightningResistance'] as int,
    iceResistance: json['iceResistance'] as int,
    dragonResistance: json['dragonResistance'] as int,
  );
}
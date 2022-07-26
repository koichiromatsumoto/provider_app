class ResOrnamentInfo {
  final int ornamentId;
  final String ornamentName;
  final int firstSkillId;
  final String firstSkillName;
  final int firstSkillLevel;
  final int secondSkillId;
  final String secondSkillName;
  final int slotSize;
  final int secondSkillLevel;

  final int useNum;

  ResOrnamentInfo({
    this.ornamentId,
    this.ornamentName,
    this.firstSkillId,
    this.firstSkillName,
    this.firstSkillLevel,
    this.secondSkillId,
    this.secondSkillName,
    this.secondSkillLevel,
    this.slotSize,
    this.useNum
  });

  factory ResOrnamentInfo.fromSimulateApiMap(Map<String, dynamic> json) => ResOrnamentInfo(
    ornamentId: json['ornamentId'] as int,
    ornamentName: json['name'] as String,
    firstSkillId: json['firstSkillId'] as int,
    firstSkillName: json['firstSkillName'] as String,
    firstSkillLevel: json['firstSkillLevel'] as int,
    secondSkillId: json['secondSkillId'] as int,
    secondSkillName: json['secondSkillName'] as String,
    secondSkillLevel: json['secondSkillLevel'] as int,
    slotSize: json['slotSize'] as int,
    useNum: json['useNum'] as int,
  );
}
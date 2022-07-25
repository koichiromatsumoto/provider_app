import '../../../../model/entity/gosekis.dart';

class SimulateGoseki {
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

  SimulateGoseki({
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

  Map<String, dynamic> toJson() => {
    'gosekiId': gosekiId,
    'firstSkillId': firstSkillId,
    'firstSkillName': firstSkillName,
    'firstSkillLevel': firstSkillLevel,
    'secondSkillId': secondSkillId,
    'secondSkillName': secondSkillName,
    'secondSkillLevel': secondSkillLevel,
    'thirdSkillId': thirdSkillId,
    'thirdSkillName': thirdSkillName,
    'thirdSkillLevel': thirdSkillLevel,
    'firstSlot': firstSlot,
    'secondSlot': secondSlot,
    'thirdSlot': thirdSlot,
  };
}
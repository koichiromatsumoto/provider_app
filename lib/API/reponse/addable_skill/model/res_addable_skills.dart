import 'package:provider_app/API/reponse/simulate/model/res_activate_skill_info.dart';
import 'package:provider_app/API/reponse/simulate/model/res_armor_info.dart';
import 'package:provider_app/API/reponse/simulate/model/res_goseki.dart';
import 'package:provider_app/API/reponse/simulate/model/res_ornament_info.dart';

class ResAddableSkill {
  final int addableSkillId;
  final String addableSkillName;
  final int addableMaxSkillLevel;

  ResAddableSkill({
    this.addableSkillId,
    this.addableSkillName,
    this.addableMaxSkillLevel,
  });

  factory ResAddableSkill.fromSimulateApiMap(Map<String, dynamic> json) => ResAddableSkill(
    addableSkillId: json['addableSkillId'] as int,
    addableSkillName: json['addableSkillName'] as String,
    addableMaxSkillLevel: json['addableMaxSkillLevel'] as int,
  );
}
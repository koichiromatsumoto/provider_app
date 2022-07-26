import 'package:provider_app/API/reponse/simulate/model/res_activate_skill_info.dart';
import 'package:provider_app/API/reponse/simulate/model/res_armor_info.dart';
import 'package:provider_app/API/reponse/simulate/model/res_goseki.dart';
import 'package:provider_app/API/reponse/simulate/model/res_ornament_info.dart';

class ResArmor {
  final List<ResArmorInfo> resArmorInfos;
  final List<ResOrnamentInfo> resOrnamentInfos;
  final ResGoseki resGoseki;
  final int maxDefenseNum;
  final List<ResActivateSkillInfo> activateSkills;

  ResArmor({
    this.resArmorInfos,
    this.resOrnamentInfos,
    this.resGoseki,
    this.maxDefenseNum,
    this.activateSkills
  });

  factory ResArmor.fromSimulateApiMap(Map<String, dynamic> json) => ResArmor(
    resArmorInfos: json['armors'] as List<ResArmorInfo>,
    resOrnamentInfos: json['ornaments'] as List<ResOrnamentInfo>,
    resGoseki: json['goseki'] as ResGoseki,
    maxDefenseNum: json['maxDefenseNum'] as int,
    activateSkills: json['activateSkills'] as List<ResActivateSkillInfo>,
  );
}
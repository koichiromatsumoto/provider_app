import 'package:provider_app/API/reponse/simulate/model/res_armor.dart';
import 'package:provider_app/API/reponse/simulate/model/res_skill.dart';
import 'package:provider_app/API/reponse/simulate/model/res_weapon_slot.dart';
import 'package:provider_app/API/request/simulate/model/simulate_goseki.dart';
import 'package:provider_app/API/request/simulate/model/simulate_skill.dart';
import 'package:provider_app/API/request/simulate/model/simulate_weapon_slot.dart';

class SimulateResponse {
  final int statusCode;
  final String errorMessage;
  final List<ResArmor> resArmors;
  final List<ResSkill> resSkills;
  final ResWeaponSlot resWeaponSlot;
  final int resArmorCount;
  final int minDefenseNum;
  final List<List<String>> lastArmors;
  final int lastDefenseNum;

  SimulateResponse({
    this.statusCode,
    this.errorMessage,
    this.resArmors,
    this.resSkills,
    this.resWeaponSlot,
    this.resArmorCount,
    this.minDefenseNum,
    this.lastArmors,
    this.lastDefenseNum
  });

  factory SimulateResponse.fromSimulateApiMap(Map<String, dynamic> json) => SimulateResponse(
    statusCode: json['statusCode'] as int,
    errorMessage: json['errorMessage'] as String,
    resArmors: json['resArmor'] as List<ResArmor>,
    resSkills: json['resSkills'] as List<ResSkill>,
    resWeaponSlot: json['resWeaponSlot'] as ResWeaponSlot,
    resArmorCount: json['resArmorCount'] as int,
    minDefenseNum: json['minDefenseNum'] as int,
    lastArmors: json['lastArmors'] as List<List<String>>,
    lastDefenseNum: json['lastDefenseNum'] as int,
  );
}
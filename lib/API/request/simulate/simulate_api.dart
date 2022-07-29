import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider_app/API/reponse/simulate/model/res_activate_skill_info.dart';
import 'package:provider_app/API/reponse/simulate/model/res_armor_info.dart';
import 'package:provider_app/API/reponse/simulate/model/res_ornament_info.dart';
import 'package:provider_app/API/reponse/simulate/model/res_weapon_slot.dart';
import 'package:provider_app/API/request/simulate/model/excluded_armor.dart';
import 'package:provider_app/API/request/simulate/model/simulate_goseki.dart';
import 'package:provider_app/API/request/simulate/model/simulate_request.dart';
import 'package:provider_app/API/request/simulate/model/simulate_skill.dart';
import 'package:provider_app/API/request/simulate/model/simulate_weapon_slot.dart';
import 'package:provider_app/model/repository/armor_repository.dart';

import '../../reponse/simulate/model/res_armor.dart';
import '../../reponse/simulate/model/res_goseki.dart';
import '../../reponse/simulate/model/res_skill.dart';
import '../../reponse/simulate/model/simulate_response.dart';

Future fetchSimulate(SimulateRequest simulateRequest) async {
  // var uri = Uri.parse('$APPDATA_UPDATE_API');
  var httpsUri = Uri(
    scheme: 'http',
    host: '10.0.2.2',
    port: 5000,
    path: '/sim',
  );

  var requestJson = json.encode(simulateRequest.toJson());

  final res = await http.post(
      httpsUri,
      body: requestJson,
      headers: {"Content-Type": "application/json"}
  );
  // var armors = [];
  if (res.statusCode == 200) {
    ResArmor resArmor = new ResArmor();
    ResArmorInfo resArmorInfo = new ResArmorInfo();
    List<ResArmor> resArmors = [];
    var resBody = jsonDecode(res.body);
    for (var jsonResArmor in resBody["resArmor"]) {
      List<ResArmorInfo> resArmorInfos = [];
      for (var jsonResArmorInfo in jsonResArmor["armors"]){
        resArmorInfos.add(ResArmorInfo.fromSimulateApiMap(jsonResArmorInfo));
      }
      List<ResOrnamentInfo> resOrnamentInfos = [];
      for (var jsonResOrnamentInfo in jsonResArmor["ornaments"]){
        resOrnamentInfos.add(ResOrnamentInfo.fromSimulateApiMap(jsonResOrnamentInfo));
      }
      ResGoseki resGoseki = ResGoseki.fromSimulateApiMap(jsonResArmor["goseki"]);
      int maxDefenseNum = jsonResArmor["maxDefenseNum"];
      List<ResActivateSkillInfo> activateSkills = [];
      if (jsonResArmor["activateSkills"].length > 0) {
        for (var jsonResActivateSkillInfo in jsonResArmor["activateSkills"]){
          activateSkills.add(ResActivateSkillInfo.fromSimulateApiMap(jsonResActivateSkillInfo));
        }
      }
      resArmors.add(ResArmor(resArmorInfos: resArmorInfos, resOrnamentInfos: resOrnamentInfos, resGoseki: resGoseki, maxDefenseNum: maxDefenseNum, activateSkills: activateSkills));
    }
    List<ResSkill> resSkills = [];
    for (var jsonResSkill in resBody["resSkills"]) {
      resSkills.add(ResSkill(skillId: jsonResSkill["skillId"], skillName: jsonResSkill["skillName"], selectedLevel: jsonResSkill["selectedLevel"]));
    }
    int resArmorCount = resBody["resArmorCount"];
    int minDefenseNum = resBody["minDefenseNum"];
    List<List<String>> lastArmors = [];
    for (var lastArmor in resBody["lastArmors"]) {
      lastArmors.add(lastArmor);
    }
    int lastDefenseNum = resBody["lastDefenseNum"];
    ResWeaponSlot resWeaponSlot = ResWeaponSlot(firstSlot: resBody["resWeaponSlot"]["firstSlot"], secondSlot: resBody["resWeaponSlot"]["secondSlot"], thirdSlot: resBody["resWeaponSlot"]["thirdSlot"]);
    SimulateResponse simulateResponse = new SimulateResponse(
      resArmors: resArmors,
      resSkills: resSkills,
      resWeaponSlot: resWeaponSlot,
      resArmorCount: resArmorCount,
      minDefenseNum: minDefenseNum,
      lastArmors: lastArmors,
      lastDefenseNum: lastDefenseNum,
    );
    return simulateResponse;
  } else {
    throw Exception('Failed to Load SimulateAPI');
  }
}
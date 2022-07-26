import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider_app/API/request/simulate/model/excluded_armor.dart';
import 'package:provider_app/API/request/simulate/model/simulate_goseki.dart';
import 'package:provider_app/API/request/simulate/model/simulate_request.dart';
import 'package:provider_app/API/request/simulate/model/simulate_skill.dart';
import 'package:provider_app/API/request/simulate/model/simulate_weapon_slot.dart';

import '../../reponse/addable_skill/model/res_addable_skills.dart';

Future addableSkillSimulate(List<SimulateSkill> simulateSkills, List<SimulateGoseki> simulateGosekis, List<ExcludedArmor> excludedArmors, SimulateWeaponSlot simulateWeaponSlot, int minDefenseNum) async {
  // var uri = Uri.parse('$APPDATA_UPDATE_API');
  var httpsUri = Uri(
    scheme: 'http',
    host: '10.0.2.2',
    port: 5000,
    path: '/addable_sim',
  );

  var request = new SimulateRequest(simulateSkills: simulateSkills, simulateGosekis: simulateGosekis, excludedArmors: excludedArmors, simulateWeaponSlot: simulateWeaponSlot, minDefenseNum: minDefenseNum, count: 10);
  var requestJson = json.encode(request.toJson());

  final res = await http.post(
      httpsUri,
      body: requestJson,
      headers: {"Content-Type": "application/json"}
  );
  if (res.statusCode == 200) {
    List<ResAddableSkill> resAddableSkills = [];
    var resBody = jsonDecode(res.body);
    for (var jsonResAddableSkill in resBody["resAddableSkills"]) {
      resAddableSkills.add(ResAddableSkill.fromSimulateApiMap(jsonResAddableSkill));
    }
    return resAddableSkills;
  } else {
    throw Exception('Failed to Load AddableSkillSimulateAPI');
  }
}
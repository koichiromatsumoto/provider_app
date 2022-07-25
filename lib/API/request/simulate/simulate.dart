import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider_app/API/reponse/simulate/model/res_armor_info.dart';
import 'package:provider_app/API/reponse/simulate/model/res_ornament_info.dart';
import 'package:provider_app/API/request/simulate/model/excluded_armor.dart';
import 'package:provider_app/API/request/simulate/model/simulate_goseki.dart';
import 'package:provider_app/API/request/simulate/model/simulate_request.dart';
import 'package:provider_app/API/request/simulate/model/simulate_skill.dart';
import 'package:provider_app/API/request/simulate/model/simulate_weapon_slot.dart';
import 'package:provider_app/model/repository/armor_repository.dart';

import '../../reponse/simulate/model/res_armor.dart';
import '../../reponse/simulate/model/res_goseki.dart';

Future fetchSimulate(List<SimulateSkill> simulateSkills, List<SimulateGoseki> simulateGosekis, List<ExcludedArmor> excludedArmors, SimulateWeaponSlot simulateWeaponSlot, int minDefenseNum) async {
  // var uri = Uri.parse('$APPDATA_UPDATE_API');
  var httpsUri = Uri(
    scheme: 'http',
    host: '10.0.2.2',
    port: 5000,
    path: '/sim',
  );

  var request = new SimulateRequest(simulateSkills: simulateSkills, simulateGosekis: simulateGosekis, excludedArmors: excludedArmors, simulateWeaponSlot: simulateWeaponSlot, minDefenseNum: minDefenseNum, count: 10);
  var requestJson = json.encode(request.toJson());

  final res = await http.post(
      httpsUri,
      body: requestJson,
      headers: {"Content-Type": "application/json"}
  );
  // var armors = [];
  if (res.statusCode == 200) {
    // for (var jsonArmor in jsonDecode(res.body)) {
    //   armors.add(Armor.fromApiMap(jsonArmor));
    // }
    // return armors;
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
      resArmors.add(ResArmor(resArmorInfos: resArmorInfos, resOrnamentInfos: resOrnamentInfos, resGoseki: resGoseki, maxDefenseNum: maxDefenseNum));
    }
    print(resArmors);
    return resArmors;
  } else {
    throw Exception('Failed to Load AppdataUpdate');
  }
}
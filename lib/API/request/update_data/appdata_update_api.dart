import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider_app/constant/strings.dart';
import 'package:provider_app/model/repository/armor_repository.dart';

import 'package:provider_app/model/entity/armors.dart';

import '../../../model/entity/ornament.dart';
import '../../../model/entity/skills.dart';
import '../../../model/repository/ornament_repository.dart';
import '../../../model/repository/skill_repository.dart';

Future<List<Armor>> getUpdatedData() async {
  // var uri = Uri.parse('$APPDATA_UPDATE_API');
  var httpsUri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 5000,
      path: '/data',
  );

  final res = await http.get(httpsUri);
  if (res.statusCode == 200) {
    List<Armor> armors = [];
    List<Skill> skills = [];
    List<Ornament> ornaments = [];
    var resBody = jsonDecode(res.body);
    for (var jsonArmor in resBody["armors"]) {
      jsonArmor["ID"] = jsonArmor["ID"] == null ? null : jsonArmor["ID"] == null ? null : jsonArmor["ID"].toInt();
      jsonArmor["スキル値1"] = jsonArmor["スキル値1"] == null ? null : jsonArmor["スキル値1"].toInt();
      jsonArmor["スキル値2"] = jsonArmor["スキル値2"] == null ? null : jsonArmor["スキル値2"].toInt();
      jsonArmor["スキル値3"] = jsonArmor["スキル値3"] == null ? null : jsonArmor["スキル値3"].toInt();
      jsonArmor["スキル値4"] = jsonArmor["スキル値4"] == null ? null : jsonArmor["スキル値4"].toInt();
      jsonArmor["スキル値5"] = jsonArmor["スキル値5"] == null ? null : jsonArmor["スキル値5"].toInt();
      jsonArmor["スキル系統番号1"] = jsonArmor["スキル系統番号1"] == null ? null : jsonArmor["スキル系統番号1"].toInt();
      jsonArmor["スキル系統番号2"] = jsonArmor["スキル系統番号2"] == null ? null : jsonArmor["スキル系統番号2"].toInt();
      jsonArmor["スキル系統番号3"] = jsonArmor["スキル系統番号3"] == null ? null : jsonArmor["スキル系統番号3"].toInt();
      jsonArmor["スキル系統番号4"] = jsonArmor["スキル系統番号4"] == null ? null : jsonArmor["スキル系統番号4"].toInt();
      jsonArmor["スキル系統番号5"] = jsonArmor["スキル系統番号5"] == null ? null : jsonArmor["スキル系統番号5"].toInt();
      jsonArmor["スロット1"] = jsonArmor["スロット1"] == null ? null : jsonArmor["スロット1"].toInt();
      jsonArmor["スロット2"] = jsonArmor["スロット2"] == null ? null : jsonArmor["スロット2"].toInt();
      jsonArmor["スロット3"] = jsonArmor["スロット3"] == null ? null : jsonArmor["スロット3"].toInt();
      jsonArmor["タイプ"] = jsonArmor["タイプ"] == null ? null : jsonArmor["タイプ"].toInt();
      jsonArmor["レア度"] = jsonArmor["レア度"] == null ? null : jsonArmor["レア度"].toInt();
      jsonArmor["仮番号"] = jsonArmor["仮番号"] == null ? null : jsonArmor["仮番号"].toInt();
      jsonArmor["個数"] = jsonArmor["個数"] == null ? null : jsonArmor["個数"].toInt();
      jsonArmor["個数1"] = jsonArmor["個数1"] == null ? null : jsonArmor["個数1"].toInt();
      jsonArmor["個数2"] = jsonArmor["個数2"] == null ? null : jsonArmor["個数2"].toInt();
      jsonArmor["個数.1"] = jsonArmor["個数.1"] == null ? null : jsonArmor["個数.1"].toInt();
      jsonArmor["個数.2"] = jsonArmor["個数.2"] == null ? null : jsonArmor["個数.2"].toInt();
      jsonArmor["個数.3"] = jsonArmor["個数.3"] == null ? null : jsonArmor["個数.3"].toInt();
      jsonArmor["初期防御力"] = jsonArmor["初期防御力"] == null ? null : jsonArmor["初期防御力"].toInt();
      jsonArmor["最終防御力"] = jsonArmor["最終防御力"] == null ? null : jsonArmor["最終防御力"].toInt();
      jsonArmor["火耐性"] = jsonArmor["火耐性"] == null ? null : jsonArmor["火耐性"].toInt();
      jsonArmor["水耐性"] = jsonArmor["水耐性"] == null ? null : jsonArmor["水耐性"].toInt();
      jsonArmor["雷耐性"] = jsonArmor["雷耐性"] == null ? null : jsonArmor["雷耐性"].toInt();
      jsonArmor["氷耐性"] = jsonArmor["氷耐性"] == null ? null : jsonArmor["氷耐性"].toInt();
      jsonArmor["龍耐性"] = jsonArmor["龍耐性"] == null ? null : jsonArmor["龍耐性"].toInt();
      jsonArmor["百竜スロット1"] = jsonArmor["百竜スロット1"] == null ? null : jsonArmor["百竜スロット1"].toInt();
      jsonArmor["百竜スロット2"] = jsonArmor["百竜スロット2"] == null ? null : jsonArmor["百竜スロット2"].toInt();
      armors.add(Armor.fromDataUpdateApiMap(jsonArmor));
    }
    await ArmorRepository.updateFromApi(armors);
    for (var jsonOrnament in resBody["ornaments"]) {
      jsonOrnament["ID"] = jsonOrnament["ID"] == null ? null : jsonOrnament["ID"] == null ? null : jsonOrnament["ID"].toInt();
      jsonOrnament["スキル値1"] = jsonOrnament["スキル値1"] == null ? null : jsonOrnament["スキル値1"].toInt();
      jsonOrnament["スキル値2"] = jsonOrnament["スキル値2"] == null ? null : jsonOrnament["スキル値2"].toInt();
      jsonOrnament["スキル系統番号1"] = jsonOrnament["スキル系統番号1"] == null ? null : jsonOrnament["スキル系統番号1"].toInt();
      jsonOrnament["スキル系統番号2"] = jsonOrnament["スキル系統番号2"] == null ? null : jsonOrnament["スキル系統番号2"].toInt();
      jsonOrnament["スロットサイズ"] = jsonOrnament["スロットサイズ"] == null ? null : jsonOrnament["スロットサイズ"].toInt();
      ornaments.add(Ornament.fromDataUpdateApiMap(jsonOrnament));
    }
    await OrnamentRepository.updateFromApi(ornaments);
    for (var jsonSkill in resBody["skills"]) {
      jsonSkill["系統番号"] = jsonSkill["系統番号"] == null ? null : jsonSkill["系統番号"] == null ? null : jsonSkill["系統番号"].toInt();
      jsonSkill["スキルレベル"] = jsonSkill["スキルレベル"] == null ? null : jsonSkill["スキルレベル"].toInt();
      skills.add(Skill.fromDataUpdateMap(jsonSkill));
    }
    await SkillRepository.updateFromApi(skills);
  } else {
    throw Exception('Failed to Load AppdataUpdateAPI');
  }
}
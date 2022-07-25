import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_app/API/request/simulate/model/simulate_skill.dart';
import 'package:provider_app/constant/configs.dart';
import 'package:provider_app/model/repository/goseki_repository.dart';
import 'package:provider_app/provider/goseki_provider.dart';
import 'package:provider_app/provider/skill_select_provider.dart';
import 'package:provider_app/provider/weapon_slot_provider.dart';

import '../API/reponse/simulate/model/res_armor.dart';
import '../API/reponse/simulate/model/res_armor_info.dart';
import '../API/request/simulate/model/simulate_goseki.dart';
import '../API/request/simulate/model/simulate_weapon_slot.dart';
import '../API/request/simulate/simulate.dart';
import '../API/request/update_data/appdata_update.dart';
import '../model/entity/armors.dart';
import '../model/entity/gosekis.dart';
import '../model/entity/skills.dart';

class SimulateResultPage extends StatefulWidget {
  final BuildContext context;
  SimulateResultPage({this.context});

  @override
  _SimulateResultPageState createState() => new _SimulateResultPageState();
}

class _SimulateResultPageState extends State<SimulateResultPage> {
  bool isLoading = false;
  List<ResArmor> resArmors;

  @override
  void initState() {
    super.initState();
  }

  Future simulate() async {
    List<SimulateSkill> simulateSkills = widget.context.read(skillSelectProvider).getSimulateSkill();
    List<SimulateGoseki> simulateGoseki = widget.context.read(gosekiProvider).getSimulateGoseki();
    SimulateWeaponSlot simulateWeaponSlot = widget.context.read(weaponSlotProvider).getSimulateWeaponSlot();
    return resArmors = await fetchSimulate(simulateSkills, simulateGoseki, [], simulateWeaponSlot, 0);
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
      future: simulate(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return mainView(context, snapshot.data);
        } else {
          return const Center(
            child: CircularProgressIndicator()
          );
        }
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("検索結果"),
          centerTitle: true,
        ),
        body: futureBuilder,
    );
  }

  Widget mainView(BuildContext context, List<ResArmor> resArmors) {
    return Container(
      padding: EdgeInsets.only(bottom: 80),
      child: Column(
          children: <Widget>[
            resArmors.first.resArmorInfos.length == 0
                ?
            Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "検索結果がありませんでした",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                )
            )
                :
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  ResArmorInfo headArmorInfo = new ResArmorInfo();
                  ResArmorInfo bodyArmorInfo = new ResArmorInfo();
                  ResArmorInfo armArmorInfo = new ResArmorInfo();
                  ResArmorInfo wstArmorInfo = new ResArmorInfo();
                  ResArmorInfo legArmorInfo = new ResArmorInfo();
                  for (var resArmorInfo in resArmors[index]
                      .resArmorInfos) {
                    if (resArmorInfo.part ==
                        ArmorPartExtension.armorParts[ArmorPart.head]) {
                      headArmorInfo = resArmorInfo;
                    } else if (resArmorInfo.part ==
                        ArmorPartExtension.armorParts[ArmorPart.body]) {
                      bodyArmorInfo = resArmorInfo;
                    } else if (resArmorInfo.part ==
                        ArmorPartExtension.armorParts[ArmorPart.arm]) {
                      armArmorInfo = resArmorInfo;
                    } else if (resArmorInfo.part ==
                        ArmorPartExtension.armorParts[ArmorPart.waist]) {
                      wstArmorInfo = resArmorInfo;
                    } else if (resArmorInfo.part ==
                        ArmorPartExtension.armorParts[ArmorPart.leg]) {
                      legArmorInfo = resArmorInfo;
                    }
                  }
                  return Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          if (index == 0) Divider(
                            color: Colors.black,
                            thickness: 1.5,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          "頭：" + headArmorInfo.armorName,
                                        ),
                                        Text(
                                          "胴：" + bodyArmorInfo.armorName,
                                        ),
                                        Text(
                                          "腕：" + armArmorInfo.armorName,
                                        ),
                                        Text(
                                          "腰：" + wstArmorInfo.armorName,
                                        ),
                                        Text(
                                          "脚：" + legArmorInfo.armorName,
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 1.5,
                          )
                        ],
                      )
                  );
                },
                itemCount: resArmors.length,
              ),
            ),
            ElevatedButton(
                child: const Text('もとのページに戻る'),
                onPressed: () => Navigator.of(context).pop()
            ),
          ]
      )
    );
  }
}
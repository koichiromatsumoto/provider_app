import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_app/API/reponse/addable_skill/model/res_addable_skills.dart';
import 'package:provider_app/API/reponse/simulate/model/simulate_response.dart';
import 'package:provider_app/API/request/simulate/model/simulate_skill.dart';
import 'package:provider_app/constant/configs.dart';
import 'package:provider_app/model/repository/goseki_repository.dart';
import 'package:provider_app/provider/goseki_provider.dart';
import 'package:provider_app/provider/skill_select_provider.dart';
import 'package:provider_app/provider/weapon_slot_provider.dart';

import '../API/reponse/simulate/model/res_armor.dart';
import '../API/reponse/simulate/model/res_armor_info.dart';
import '../API/reponse/simulate/model/res_goseki.dart';
import '../API/request/addable_skill/addable_skill_api.dart';
import '../API/request/simulate/model/simulate_goseki.dart';
import '../API/request/simulate/model/simulate_weapon_slot.dart';
import '../API/request/simulate/simulate_api.dart';
import '../API/request/update_data/appdata_update_api.dart';
import '../component/simulate_result_text.dart';
import '../constant/colors.dart';
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
  SimulateResponse simulateResponse;
  List<ResAddableSkill> resAddableSkills;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<SimulateSkill> simulateSkills = context.read(skillSelectProvider).getSimulateSkill();
    List<SimulateGoseki> simulateGoseki = context.read(gosekiProvider).getSimulateGoseki();
    SimulateWeaponSlot simulateWeaponSlot = context.read(weaponSlotProvider).getSimulateWeaponSlot();

    Future simulate() async {
      simulateResponse = await fetchSimulate(simulateSkills, simulateGoseki, [], simulateWeaponSlot, 0);
      return simulateResponse;
    }

    Future addedSkillSimulate() async {
      resAddableSkills = await addableSkillSimulate(simulateSkills, simulateGoseki, [], simulateWeaponSlot, 0);
      return resAddableSkills;
    }

    var simulateFutureBuilder = FutureBuilder(
      future: simulate(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return simulateMainView(context, snapshot.data);
        } else {
          return const Center(
            child: CircularProgressIndicator()
          );
        }
      },
    );

    var addedSkillFutureBuilder = FutureBuilder(
      future: addedSkillSimulate(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return addedSkillMainView(context, snapshot.data);
        } else {
          return const Center(
              child: CircularProgressIndicator()
          );
        }
      },
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("検索結果"),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Column(
              children: [
                Container(
                  color: Colors.black12,
                  height: 3
                ),
                Ink(
                  color: THEME_COLOR,
                  child: TabBar(
                    tabs: <Tab>[
                      Tab(
                        text: '検索結果',
                      ),
                      Tab(
                        text: "追加できるスキル",
                      )
                    ],
                    unselectedLabelColor: Colors.white54,
                    indicatorColor: Colors.white,
                  ),
                )
              ],
            )
          )
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 80),
          child: TabBarView(
            children: [
              simulateFutureBuilder,
              addedSkillFutureBuilder
            ],
          )
        )
      )
    );
  }

  Widget simulateMainView(BuildContext context, SimulateResponse simulateResponse) {
    return Column(
      children: <Widget>[
        simulateResponse.resArmors.first.resArmorInfos.length == 0
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
            child: MediaQuery.removePadding(
                context: context,
                removeBottom: true,
                child: Container(
                    color: LISTVIEW_BACKGROUND_COLOR,
                    child: Scrollbar(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          ResArmorInfo headArmorInfo = new ResArmorInfo();
                          ResArmorInfo bodyArmorInfo = new ResArmorInfo();
                          ResArmorInfo armArmorInfo = new ResArmorInfo();
                          ResArmorInfo wstArmorInfo = new ResArmorInfo();
                          ResArmorInfo legArmorInfo = new ResArmorInfo();
                          for (var resArmorInfo in simulateResponse.resArmors[index].resArmorInfos) {
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
                          ResGoseki goseki = simulateResponse.resArmors[index].resGoseki;
                          String weaponSlotText =
                              simulateResponse.resWeaponSlot.firstSlot.toString() + "-" +
                                  simulateResponse.resWeaponSlot.secondSlot.toString() + "-" +
                                  simulateResponse.resWeaponSlot.thirdSlot.toString();
                          String gosekiText = goseki.gosekiId == null ?
                          "なし" :
                          goseki.secondSkillName == "" ?
                          goseki.firstSkillName + ":" + goseki.firstSkillLevel.toString() + " "
                              + "スロ" + goseki.firstSlot.toString() + "-" + goseki.secondSlot.toString() + "-" + goseki.thirdSlot.toString() :
                          goseki.firstSkillName + ":" + goseki.firstSkillLevel.toString() + " "
                              + goseki.secondSkillName + ":" + goseki.secondSkillLevel.toString() + " "
                              + "スロ" + goseki.firstSlot.toString() + "-" + goseki.secondSlot.toString() + "-" + goseki.thirdSlot.toString();
                          return Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    border: index != simulateResponse.resArmors.length - 1 ? const Border(
                                        bottom: const BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        )
                                    ) : null,
                                  ),
                                  child: TextButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          onPrimary: Colors.black87,
                                          // side: BorderSide(
                                          //   width: 0,
                                          // ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(0),
                                            ),
                                          )
                                      ),
                                      child: Column(
                                        children: [
                                          if (index == 0)
                                            Padding(padding: EdgeInsets.only(top: 10))
                                          else
                                            Padding(padding: EdgeInsets.only(top: 5)),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Flexible(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Flexible(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              simulateResultText(
                                                                "【武器スロ】" + weaponSlotText,
                                                              ),
                                                              simulateResultText(
                                                                "【頭】" + headArmorInfo.armorName,
                                                              ),
                                                              simulateResultText(
                                                                "【胴】" + bodyArmorInfo.armorName,
                                                              ),
                                                              simulateResultText(
                                                                "【腕】" + armArmorInfo.armorName,
                                                              ),
                                                              simulateResultText(
                                                                "【腰】" + wstArmorInfo.armorName,
                                                              ),
                                                              simulateResultText(
                                                                "【脚】" + legArmorInfo.armorName,
                                                              ),
                                                              simulateResultText(
                                                                "【護石】" + gosekiText,
                                                                // "【護石】" + "貫通弾・貫通矢強化3 通常弾・通常矢強化3 スロ 3-3-3",
                                                              ),
                                                            ],
                                                          )
                                                      ),
                                                      Container(
                                                          margin: EdgeInsets.only(left: 10),
                                                          width: 75,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              simulateResultText(
                                                                "防御力: " + simulateResponse.resArmors[index].maxDefenseNum.toString(),
                                                              ),
                                                              simulateResultText(
                                                                "火耐性: " + "10",
                                                              ),
                                                              simulateResultText(
                                                                "水耐性: " + "-25",
                                                              ),
                                                              simulateResultText(
                                                                "雷耐性: " + "0",
                                                              ),
                                                              simulateResultText(
                                                                "氷耐性: " + "0",
                                                              ),
                                                              simulateResultText(
                                                                "龍耐性: " + "0",
                                                              ),
                                                            ],
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 20,
                                                  child: Icon(
                                                      Icons.arrow_forward_ios
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (index == simulateResponse.resArmors.length - 1) Padding(
                                            padding: EdgeInsets.only(bottom: 10),
                                          ) else Padding(
                                            padding: EdgeInsets.only(bottom: 5),
                                          ),
                                        ],
                                      )
                                  )
                              ),
                            ],
                          );
                        },
                        itemCount: simulateResponse.resArmors.length,
                      ),
                    )
                )
            )
        )
      ]
    );
  }

  Widget addedSkillMainView(BuildContext context, List<ResAddableSkill> addableSkills) {
    return Column(
        children: <Widget>[
          addableSkills.length == 0
              ?
          Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "追加できるスキルがありませんでした",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              )
          )
              :
          Expanded(
              child: MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  child: Container(
                      color: LISTVIEW_BACKGROUND_COLOR,
                      child: Scrollbar(
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                    child: Text(
                                        addableSkills[index].addableSkillName + "Lv." +
                                        addableSkills[index].addableMaxSkillLevel.toString()
                                    )
                                ),
                              ],
                            );
                          },
                          itemCount: addableSkills.length,
                        ),
                      )
                  )
              )
          )
        ]
    );
  }

  // Widget addedSkillMainView(BuildContext context, SimulateResponse simulateResponse) {
  //   return Text("aaa");
  // }
}
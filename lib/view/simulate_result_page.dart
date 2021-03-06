import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_app/API/reponse/addable_skill/model/res_addable_skills.dart';
import 'package:provider_app/API/reponse/simulate/model/simulate_response.dart';
import 'package:provider_app/API/request/simulate/model/simulate_request.dart';
import 'package:provider_app/API/request/simulate/model/simulate_skill.dart';
import 'package:provider_app/constant/configs.dart';
import 'package:provider_app/provider/goseki_provider.dart';
import 'package:provider_app/provider/simulate_result_provider.dart';
import 'package:provider_app/provider/skill_select_provider.dart';
import 'package:provider_app/provider/weapon_slot_provider.dart';

import '../API/reponse/simulate/model/res_armor_info.dart';
import '../API/reponse/simulate/model/res_goseki.dart';
import '../API/request/addable_skill/addable_skill_api.dart';
import '../API/request/simulate/model/simulate_goseki.dart';
import '../API/request/simulate/model/simulate_weapon_slot.dart';
import '../API/request/simulate/simulate_api.dart';
import '../component/simulate_result_text.dart';
import '../constant/colors.dart';
import '../constant/strings.dart';

class SimulateResultPage extends ConsumerStatefulWidget {
  final BuildContext context;
  SimulateResultPage({this.context});

  @override
  _SimulateResultPageState createState() => new _SimulateResultPageState();
}

class _SimulateResultPageState extends ConsumerState<SimulateResultPage> {
  bool isLoading = false;
  SimulateResponse simulateResponse;
  List<ResAddableSkill> resAddableSkills;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final beforeSimulateRequest = ref.read(simulateResultProvider).simulateRequest;
    List<SimulateSkill> simulateSkills = ref.read(skillSelectProvider).getSimulateSkill();
    List<SimulateGoseki> simulateGoseki = ref.read(gosekiProvider).getSimulateGoseki();
    SimulateWeaponSlot simulateWeaponSlot = ref.read(weaponSlotProvider).getSimulateWeaponSlot();
    SimulateRequest simulateRequest = SimulateRequest(
      simulateSkills: simulateSkills,
      simulateGosekis: simulateGoseki,
      simulateWeaponSlot: simulateWeaponSlot,
      excludedArmors: [],
      count: 10,
      minDefenseNum: 0
    );

    Future simulate() async {
      // if (simulateRequest == beforeSimulateRequest) {
      //   return ref.read(simulateResultProvider).simulateResponse;
      // }
      simulateResponse = await fetchSimulate(simulateRequest);
      ref.read(simulateResultProvider).setSimulateInfo(simulateRequest, simulateResponse);
      return simulateResponse;
    }

    Future addedSkillSimulate() async {
      // if (simulateRequest == beforeSimulateRequest) {
      //   return ref.read(simulateResultProvider).resAddableSkills;
      // }
      resAddableSkills = await addableSkillSimulate(simulateRequest);
      ref.read(simulateResultProvider).setAddableSimulateInfo(resAddableSkills);
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
          title: Text("????????????"),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
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
                        text: '????????????',
                      ),
                      Tab(
                        text: "????????????????????????",
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
                "???????????????????????????????????????",
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
                          "??????" :
                          goseki.secondSkillName == "" ?
                          goseki.firstSkillName + ":" + goseki.firstSkillLevel.toString() + " "
                              + "??????" + goseki.firstSlot.toString() + "-" + goseki.secondSlot.toString() + "-" + goseki.thirdSlot.toString() :
                          goseki.firstSkillName + ":" + goseki.firstSkillLevel.toString() + " "
                              + goseki.secondSkillName + ":" + goseki.secondSkillLevel.toString() + " "
                              + "??????" + goseki.firstSlot.toString() + "-" + goseki.secondSlot.toString() + "-" + goseki.thirdSlot.toString();
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
                                                                "??????????????????" + weaponSlotText,
                                                              ),
                                                              simulateResultText(
                                                                "?????????" + headArmorInfo.armorName,
                                                              ),
                                                              simulateResultText(
                                                                "?????????" + bodyArmorInfo.armorName,
                                                              ),
                                                              simulateResultText(
                                                                "?????????" + armArmorInfo.armorName,
                                                              ),
                                                              simulateResultText(
                                                                "?????????" + wstArmorInfo.armorName,
                                                              ),
                                                              simulateResultText(
                                                                "?????????" + legArmorInfo.armorName,
                                                              ),
                                                              simulateResultText(
                                                                "????????????" + gosekiText,
                                                                // "????????????" + "???????????????????????????3 ???????????????????????????3 ?????? 3-3-3",
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
                                                                "?????????: " + simulateResponse.resArmors[index].maxDefenseNum.toString(),
                                                              ),
                                                              simulateResultText(
                                                                "?????????: " + "10",
                                                              ),
                                                              simulateResultText(
                                                                "?????????: " + "-25",
                                                              ),
                                                              simulateResultText(
                                                                "?????????: " + "0",
                                                              ),
                                                              simulateResultText(
                                                                "?????????: " + "0",
                                                              ),
                                                              simulateResultText(
                                                                "?????????: " + "0",
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
    List<int> skillLevelList(ResAddableSkill addableSkill) {
      List<int> rt = [];
      for (var i = 1; i <= addableSkill.addableMaxSkillLevel; i++) {
        rt.add(i);
      }
      return rt;
    }
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
                  "???????????????????????????????????????????????????",
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
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      color: LISTVIEW_BACKGROUND_COLOR,
                      child: Scrollbar(
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Column(
                                children: [
                                  if (index == 0) Padding(
                                    padding: EdgeInsets.only(top: 10),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: IconButton(
                                                onPressed: (){},
                                                icon: Icon(
                                                  Icons.add_circle_outline,
                                                  color: SECOND_THEME_COLOR,
                                                )
                                            )
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            child: Text(
                                                addableSkills[index].addableSkillName
                                            )
                                          ),
                                        ],
                                      ),
                                      Container(
                                          alignment: Alignment.bottomRight,
                                          child: Row(
                                            children: [
                                              Text(
                                                  LEVEL
                                              ),
                                              DropdownButton<int>(
                                                value: addableSkills[index].addableMaxSkillLevel,
                                                onChanged: (newValue) {
                                                  // setState(() {
                                                  //   ref.read(skillSelectProvider).setSelectedSkillLevel(ref.read(skillSelectProvider).selectedSkills.elementAt(index), newValue);
                                                  // });
                                                },
                                                items: skillLevelList(addableSkills[index]).map<DropdownMenuItem<int>>((int value) {
                                                  return DropdownMenuItem<int>(
                                                    value: value,
                                                    child: Text(value.toString()),
                                                  );
                                                }).toList(),
                                              )
                                            ],
                                          )
                                      )
                                    ],
                                  ),
                                  if (index == addableSkills.length - 1) Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: addableSkills.length,
                        ),
                      )
                  )
              )
          ),
          ElevatedButton(
              onPressed: (){},
              child: Text("??????????????????")
          ),
          ElevatedButton(
              onPressed: (){},
              child: Text("?????????")
          ),
        ]
    );
  }
}
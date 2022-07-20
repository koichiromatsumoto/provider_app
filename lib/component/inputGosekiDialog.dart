import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider_app/model/repository/goseki_repository.dart';

import '../constant/configs.dart';
import '../constant/strings.dart';
import '../model/entity/gosekis.dart';
import '../model/entity/skills.dart';
import '../provider/skill_select_provider.dart';

Future<void> inputGosekiDialog(BuildContext context, List<Skill> skills) async {
  final _formKey = GlobalKey<FormState>();
  return showDialog(
      context: context,
      builder: (context) {
        Skill firstSkill;
        Skill secondSkill;
        int defaultSlot = 0;
        Goseki goseki = Goseki(
            firstSlot: defaultSlot,
            secondSlot: defaultSlot,
            thirdSlot: defaultSlot
        );
        int defaultSkillLevel = 1;

        List<int> skillLevelList(Skill skill) {
          List<int> rt = [];
          for (var i = 1; i <= skill.getMaxLevel; i++) {
            rt.add(i);
          }
          return rt;
        }

        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 200.0,
                ),
                child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton<Skill>(
                              value: firstSkill,
                              hint: Text('-- 1つ目のスキル --'),
                              onChanged: (newValue) {
                                setState(() {
                                  firstSkill = newValue;
                                  firstSkill.selectedLevel = defaultSkillLevel;
                                  goseki.firstSkillId = firstSkill.id;
                                  goseki.firstSkillName = firstSkill.skillName;
                                  goseki.firstSkillLevel = defaultSkillLevel;
                                });
                              },
                              items: skills.map<DropdownMenuItem<Skill>>((Skill value) {
                                return DropdownMenuItem<Skill>(
                                  value: value,
                                  child: Text(value.skillName),
                                );
                              }).toList(),
                            ),
                            Row(
                              children: [
                                Text(
                                    LEVEL
                                ),
                                DropdownButton<int>(
                                  value: firstSkill == null ? null : goseki.firstSkillLevel,
                                  onChanged: (newValue) {
                                    setState(() {
                                      goseki.firstSkillLevel = newValue;
                                    });
                                  },
                                  items: firstSkill == null ? null :
                                  skillLevelList(firstSkill).map<DropdownMenuItem<int>>((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()),
                                    );
                                  }
                                  ).toList(),
                                )
                              ],
                            )
                          ]
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton<Skill>(
                              value: secondSkill,
                              hint: Text('-- 2つ目のスキル --'),
                              onChanged: (newValue) {
                                setState(() {
                                  secondSkill = newValue;
                                  goseki.secondSkillId = secondSkill.id;
                                  goseki.secondSkillName = secondSkill.skillName;
                                  goseki.secondSkillLevel = defaultSkillLevel;
                                });
                              },
                              items: skills.map<DropdownMenuItem<Skill>>((Skill value) {
                                return DropdownMenuItem<Skill>(
                                  value: value,
                                  child: Text(value.skillName),
                                );
                              }).toList(),
                            ),
                            Row(
                              children: [
                                Text(
                                    LEVEL
                                ),
                                DropdownButton<int>(
                                  value: secondSkill == null ? null : goseki.secondSkillLevel,
                                  onChanged: (newValue) {
                                    setState(() {
                                      goseki.secondSkillLevel = newValue;
                                    });
                                  },
                                  items: secondSkill == null ? null :
                                  skillLevelList(secondSkill).map<DropdownMenuItem<int>>((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()),
                                    );
                                  }
                                  ).toList(),
                                )
                              ],
                            )
                          ]
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "スロット",
                              ),
                            ),
                            DropdownButton<int>(
                              value: goseki.firstSlot,
                              onChanged: (newValue) {
                                setState(() {
                                  goseki.firstSlot = newValue;
                                });
                              },
                              items: WeaponSlot.slotList.map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                            ),
                            DropdownButton<int>(
                              value: goseki.secondSlot,
                              onChanged: (newValue) {
                                setState(() {
                                  goseki.secondSlot = newValue;
                                });
                              },
                              items: WeaponSlot.slotList.map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                            ),
                            DropdownButton<int>(
                              value: goseki.thirdSlot,
                              onChanged: (newValue) {
                                setState(() {
                                  goseki.thirdSlot = newValue;
                                });
                              },
                              items: WeaponSlot.slotList.map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      )
                    ]
                )
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'キャンセル',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
              TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  GosekiRepository.create(goseki);
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
            ],
          );
        });
      });
}

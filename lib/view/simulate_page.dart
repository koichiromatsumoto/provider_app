import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider_app/component/devise_max_width_btn.dart';
import 'package:provider_app/constant/colors.dart';
import 'package:provider_app/constant/configs.dart';
import 'package:provider_app/constant/strings.dart';
import 'package:provider_app/model/entity/skills.dart';
import 'package:provider_app/view/simulate_detail_setting_page.dart';
import 'package:provider_app/view/simulate_result_page.dart';
import 'package:provider_app/provider/skill_select_provider.dart';
import 'package:provider_app/provider/weapon_slot_provider.dart';

class SimulatePage extends StatefulWidget {

  @override
  _SimulatePageState createState() => new _SimulatePageState();
}

class _SimulatePageState extends State<SimulatePage> {
  final items = Skill.skills
      .map((skill) => MultiSelectItem<Skill>(skill, skill.skillName))
      .toList();
  List<Skill> _selectedSkills = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  List<int> skillLevelList(Skill skill) {
    List<int> rt = [];
    for (var i = 1; i <= skill.getMaxLevel; i++) {
      rt.add(i);
    }
    return rt;
  }

  @override
  void initState() {
    _selectedSkills = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.SIMULATE_PAGE),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: Column(
          children: [
            Expanded(
              child: Consumer(
                  builder: (context, watch, child){
                    return Column(
                      children: <Widget>[
                        DeviseMaxWidthBtn(AppString.SIMULATE_DETAIL_SETTING, SimulateDetailSettingPage()),
                        Container(
                          width: deviceWidth,
                          height: 60,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppString.WEAPON_SLOT,
                                  ),
                                ),
                                DropdownButton<int>(
                                  value: WeaponSlot.firstSlotDefaultValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      WeaponSlot.firstSlotDefaultValue = newValue;
                                    });
                                    context.read(weaponSlotProvider).setFirstSlot(newValue);
                                  },
                                  items: WeaponSlot.slotList.map<DropdownMenuItem<int>>((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                ),
                                DropdownButton<int>(
                                  value: WeaponSlot.secondSlotDefaultValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      WeaponSlot.secondSlotDefaultValue = newValue;
                                    });
                                    context.read(weaponSlotProvider).setSecondSlot(newValue);
                                  },
                                  items: WeaponSlot.slotList.map<DropdownMenuItem<int>>((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                ),
                                DropdownButton<int>(
                                  value: WeaponSlot.thirdSlotDefaultValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      WeaponSlot.thirdSlotDefaultValue = newValue;
                                    });
                                    context.read(weaponSlotProvider).setThirdSlot(newValue);
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
                          ),
                          decoration: BoxDecoration(
                            border: const Border(
                              bottom: const BorderSide(
                                color: AppColor.MAX_WIDTH_BTN_BORDER_COLOR,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: deviceWidth,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30, 10, 30, 15),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(bottom: 15),
                                    child: MultiSelectDialogField<Skill>(
                                      key: _multiSelectKey,
                                      title: Text(AppString.SELECT_SKILLS),
                                      buttonText: Text(AppString.SELECT_SKILLS_EXPLAIN),
                                      items: items,
                                      searchable: true,
                                      onConfirm: (values) {
                                        setState(() {
                                          _selectedSkills = values;
                                        });
                                        _multiSelectKey.currentState.validate();
                                        context.read(skillSelectProvider).handleChange(_selectedSkills);
                                        context.read(skillSelectProvider).setDefaultSkillLevels(_selectedSkills);
                                      },
                                      chipDisplay: MultiSelectChipDisplay.none(),
                                    ),
                                  ),
                                  Expanded(
                                    child: MediaQuery.removePadding(
                                      context: context,
                                      removeBottom: true,
                                      child: Container(
                                        color: AppColor.LISTVIEW_BACKGROUND_COLOR,
                                        child: Scrollbar(
                                          child: ListView.builder(
                                            itemBuilder: (BuildContext context, int index) {
                                              return Container(
                                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        alignment: Alignment.topLeft,
                                                        child: IconButton(
                                                            icon: Icon(Icons.clear),
                                                            onPressed: () {
                                                              context.read(skillSelectProvider).clear(index);
                                                              setState(() {
                                                                _selectedSkills = watch(skillSelectProvider).selectedSkills;
                                                              });
                                                            },
                                                            highlightColor: AppColor.SECOND_THEME_COLOR,
                                                        ),
                                                        padding: EdgeInsets.only(right: 10),
                                                      ),
                                                      Container(
                                                        alignment: Alignment.topLeft,
                                                        child: Text(
                                                            watch(skillSelectProvider).selectedSkills.elementAt(index).skillName,
                                                            style: TextStyle(fontSize: 15)
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                          alignment: Alignment.bottomRight,
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                AppString.LEVEL
                                                              ),
                                                              DropdownButton<int>(
                                                                value: watch(skillSelectProvider).selectedSkills.elementAt(index).selectedLevel,
                                                                onChanged: (newValue) {
                                                                  context.read(skillSelectProvider).setSelectedSkillLevel(watch(skillSelectProvider).selectedSkills.elementAt(index), newValue);
                                                                  setState(() {
                                                                    _selectedSkills = watch(skillSelectProvider).selectedSkills;
                                                                  });
                                                                },
                                                                items: skillLevelList(watch(skillSelectProvider).selectedSkills.elementAt(index)).map<DropdownMenuItem<int>>((int value) {
                                                                  return DropdownMenuItem<int>(
                                                                    value: value,
                                                                    child: Text(value.toString()),
                                                                  );
                                                                }).toList(),
                                                              )
                                                            ],
                                                          )
                                                      ),
                                                    ],
                                                  )
                                              );
                                            },
                                            itemCount: watch(skillSelectProvider).selectedSkills != null ? watch(skillSelectProvider).selectedSkills.length : 0
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            child: const Text(AppString.SIMULATE_BTN),
                            onPressed: _selectedSkills.isEmpty ? null : () => Navigator.of(context).push(
                                MaterialPageRoute<PageRoute<Widget>>(
                                    builder: (_) => SimulateResultPage()
                                )
                            )
                        ),
                        // const Text('装備検索のタブです'),
                        // ElevatedButton(
                        //     child: const Text('お気に入り装備を表示'),
                        //     onPressed: () => context.read(navigationHistoryProvider).moveTo(TabIndex.FavoriteIndex)),
                        // ElevatedButton(
                        //     child: const Text('護石を表示'),
                        //     onPressed: () => context.read(navigationHistoryProvider).moveTo(TabIndex.GosekiIndex)),
                        // ElevatedButton(
                        //     child: const Text('もどる'),
                        //     onPressed: context.read(navigationHistoryProvider).hasHistory ? context.read(navigationHistoryProvider).pop : null),
                        // Text(
                        //     '${watch(counterProvider).count} 回押しました！'
                        // ),
                        // FloatingActionButton(
                        //   onPressed: () {
                        //     context.read(counterProvider).increment();
                        //   },
                        //   tooltip: 'Increment',
                        //   child: Icon(Icons.add),
                        // ),
                      ],
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
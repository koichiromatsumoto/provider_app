import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider_app/configs/skills.dart';
import 'package:provider_app/configs/tab_index.dart';
import 'package:provider_app/configs/weapon_slot.dart';
import 'package:provider_app/domain/skills.dart';
import 'package:provider_app/pages/simulate_detail_setting_page.dart';
import 'package:provider_app/providers/counter_provider.dart';
import 'package:provider_app/providers/navigation_history_provider.dart';
import 'package:provider_app/providers/skill_select_provider.dart';
import 'package:provider_app/providers/weapon_first_slot_provider.dart';
import 'package:provider_app/providers/weapon_second_slot_provider.dart';
import 'package:provider_app/providers/weapon_third_slot_provider.dart';

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

  @override
  void initState() {
    _selectedSkills = Skill.skills;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("装備検索"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(
                builder: (context, watch, child){
                  return Column(
                    children: <Widget>[
                      Container(
                        width: deviceWidth,
                        height: 60,
                        child: TextButton(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '検索詳細設定',
                                  ),
                                ),
                                Icon(
                                    Icons.arrow_forward_ios
                                ),
                              ],
                            ),
                          ),
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute<PageRoute<Widget>>(
                                builder: (_) => OtherPage()
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: const Border(
                            bottom: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
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
                                  '武器スロット',
                                ),
                              ),
                              DropdownButton<int>(
                                value: WeaponSlot.firstSlotDefaultValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    WeaponSlot.firstSlotDefaultValue = newValue;
                                  });
                                  context.read(weaponFirstSlotProvider).handleChange(newValue);
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
                                  context.read(weaponSecondSlotProvider).handleChange(newValue);
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
                                  context.read(weaponThirdSlotProvider).handleChange(newValue);
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
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: deviceWidth,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 50),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: MultiSelectDialogField<Skill>(
                                  key: _multiSelectKey,
                                  title: Text("スキル選択"),
                                  buttonText: Text("--スキルを選択してください--"),
                                  items: items,
                                  searchable: true,
                                  onConfirm: (values) {
                                    setState(() {
                                      _selectedSkills = values;
                                    });
                                    _multiSelectKey.currentState.validate();
                                    context.read(skillSelectProvider).handleChange(values);
                                  },
                                  chipDisplay: MultiSelectChipDisplay(
                                    onTap: (item) {
                                      setState(() {
                                        _selectedSkills.remove(item);
                                      });
                                      _multiSelectKey.currentState.validate();
                                    },
                                  ),
                                ),
                              ),
                              // ListView.builder(
                              //   itemBuilder: (BuildContext context, int index) {
                              //     return Text(watch(skillSelectProvider).selectedSkills[index]);
                              //   },
                              //   itemCount: watch(skillSelectProvider).selectedSkills.length,
                              //   shrinkWrap: true,
                              // ),
                            ],
                          ),
                        ),
                      ),
                      const Text('装備検索のタブです'),
                      ElevatedButton(
                          child: const Text('お気に入り装備を表示'),
                          onPressed: () => context.read(navigationHistoryProvider).moveTo(TabIndex.FavoriteIndex)),
                      ElevatedButton(
                          child: const Text('護石を表示'),
                          onPressed: () => context.read(navigationHistoryProvider).moveTo(TabIndex.GosekiIndex)),
                      ElevatedButton(
                          child: const Text('もどる'),
                          onPressed: context.read(navigationHistoryProvider).hasHistory ? context.read(navigationHistoryProvider).pop : null),
                      Text(
                          '${watch(counterProvider).count} 回押しました！'
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          context.read(counterProvider).increment();
                        },
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                      ),
                    ],
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
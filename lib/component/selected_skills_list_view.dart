import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider_app/component/weapon_slot_dropdown.dart';

import '../constant/colors.dart';
import '../constant/configs.dart';
import '../constant/strings.dart';
import '../model/entity/skills.dart';
import '../provider/skill_select_provider.dart';
import '../provider/weapon_slot_provider.dart';

class SelectedSkillsListView extends StatefulWidget {
  BuildContext consumerContext;
  SelectedSkillsListView(this.consumerContext);

  @override
  _SelectedSkillsListViewState createState() => _SelectedSkillsListViewState();
}

class _SelectedSkillsListViewState extends State<SelectedSkillsListView> {
  @override
  Widget build(BuildContext context) {
    List<int> skillLevelList(Skill skill) {
      List<int> rt = [];
      for (var i = 1; i <= skill.getMaxLevel; i++) {
        rt.add(i);
      }
      return rt;
    }
    return Expanded(
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
                              setState(() {
                                widget.consumerContext.read(skillSelectProvider).clear(index);
                              });
                            },
                            highlightColor: AppColor.SECOND_THEME_COLOR,
                          ),
                          padding: EdgeInsets.only(right: 10),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                              widget.consumerContext.read(skillSelectProvider).selectedSkills.elementAt(index).skillName,
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
                                  value: widget.consumerContext.read(skillSelectProvider).selectedSkills.elementAt(index).selectedLevel,
                                  onChanged: (newValue) {
                                    setState(() {
                                      widget.consumerContext.read(skillSelectProvider).setSelectedSkillLevel(widget.consumerContext.read(skillSelectProvider).selectedSkills.elementAt(index), newValue);
                                    });
                                  },
                                  items: skillLevelList(widget.consumerContext.read(skillSelectProvider).selectedSkills.elementAt(index)).map<DropdownMenuItem<int>>((int value) {
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
              itemCount: widget.consumerContext.read(skillSelectProvider).selectedSkills != null ? widget.consumerContext.read(skillSelectProvider).selectedSkills.length : 0
            ),
          ),
        ),
      ),
    );
  }
}
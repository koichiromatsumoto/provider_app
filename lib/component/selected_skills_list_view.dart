import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../constant/colors.dart';
import '../constant/strings.dart';
import '../model/entity/skills.dart';
import '../provider/skill_select_provider.dart';

// 選択スキルリストビュー
class SelectedSkillsListView extends ConsumerStatefulWidget {
  BuildContext consumerContext;
  SelectedSkillsListView(this.consumerContext);

  @override
  _SelectedSkillsListViewState createState() => _SelectedSkillsListViewState();
}

class _SelectedSkillsListViewState extends ConsumerState<SelectedSkillsListView> {
  @override
  Widget build(BuildContext context) {
    List<int> skillLevelList(Skill skill) {
      List<int> rt = [];
      for (var i = 1; i <= skill.maxLevel; i++) {
        rt.add(i);
      }
      return rt;
    }
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: Container(
          color: LISTVIEW_BACKGROUND_COLOR,
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
                                  ref.read(skillSelectProvider).clear(index);
                                });
                              },
                              highlightColor: SECOND_THEME_COLOR,
                            ),
                            padding: EdgeInsets.only(right: 10),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                                ref.read(skillSelectProvider).selectedSkills.elementAt(index).skillName,
                                style: TextStyle(fontSize: 15)
                            ),
                          ),
                          Spacer(),
                          Container(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [
                                  Text(
                                      LEVEL
                                  ),
                                  DropdownButton<int>(
                                    value: ref.read(skillSelectProvider).selectedSkills.elementAt(index).selectedLevel,
                                    onChanged: (newValue) {
                                      setState(() {
                                        ref.read(skillSelectProvider).setSelectedSkillLevel(ref.read(skillSelectProvider).selectedSkills.elementAt(index), newValue);
                                      });
                                    },
                                    items: skillLevelList(ref.read(skillSelectProvider).selectedSkills.elementAt(index)).map<DropdownMenuItem<int>>((int value) {
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
                itemCount: ref.read(skillSelectProvider).selectedSkills != null ? ref.read(skillSelectProvider).selectedSkills.length : 0
            ),
          ),
        ),
      ),
    );
  }
}
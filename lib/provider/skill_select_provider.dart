import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_app/API/request/simulate/model/simulate_skill.dart';
import 'package:provider_app/model/entity/skills.dart';

final skillSelectProvider = ChangeNotifierProvider(
      (ref) => SkillSelector(),
);

class SkillSelector extends ChangeNotifier {
  List<Skill> selectedSkills = [];
  List<SimulateSkill> simulateSkills = [];
  int defaultSkillLevel = 1;

  void handleChange(List<Skill> newValue) {
    selectedSkills = newValue;
  }
  void setDefaultSkillLevels(List<Skill> skills) {
    for (var skill in skills) {
      if (skill.selectedLevel == null) {
        skill.selectedLevel = defaultSkillLevel;
      }
    }
  }
  void setSelectedSkillLevel(Skill skill, int newValue) {
    skill.selectedLevel = newValue;
  }
  void clear(int index) {
    selectedSkills[index].selectedLevel = defaultSkillLevel;
    selectedSkills.removeAt(index);
  }
  VoidCallback allClear() {
    selectedSkills.clear();
  }
  List<SimulateSkill> getSimulateSkill() {
    simulateSkills.clear();
    for (var selectedSkill in selectedSkills) {
      simulateSkills.add(SimulateSkill(skillId: selectedSkill.skillId, skillName: selectedSkill.skillName, selectedLevel: selectedSkill.selectedLevel));
    }
    return simulateSkills;
  }
}
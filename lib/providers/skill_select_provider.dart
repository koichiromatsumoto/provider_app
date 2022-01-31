import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_app/configs/weapon_slot.dart';
import 'package:provider_app/domain/skills.dart';

final skillSelectProvider = ChangeNotifierProvider(
      (ref) => SkillSelector(),
);

class SkillSelector extends ChangeNotifier {
  List<Skill> selectedSkills = [];

  void handleChange(List<Skill> newValue) {
    selectedSkills = newValue;
  }
}
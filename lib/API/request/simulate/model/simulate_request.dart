import 'package:provider_app/API/request/simulate/model/simulate_goseki.dart';
import 'package:provider_app/API/request/simulate/model/simulate_skill.dart';
import 'package:provider_app/API/request/simulate/model/simulate_weapon_slot.dart';

import 'excluded_armor.dart';

class SimulateRequest {
  final List<SimulateSkill> simulateSkills;
  final List<SimulateGoseki> simulateGosekis;
  final List<ExcludedArmor> excludedArmors;
  final SimulateWeaponSlot simulateWeaponSlot;
  final int count;
  final int minDefenseNum;
  // final List<LastArmor> lastArmors;
  // final int lastDefenseNum;

  SimulateRequest({
    this.simulateSkills,
    this.simulateGosekis,
    this.excludedArmors,
    this.simulateWeaponSlot,
    this.count,
    this.minDefenseNum,
  });

  Map<String, dynamic> toJson() => {
    'skills': simulateSkills,
    'gosekis': simulateGosekis,
    'excludedArmors': excludedArmors,
    'weaponSlot': simulateWeaponSlot,
    'count': count,
    'minDefenseNum': minDefenseNum,
  };
}
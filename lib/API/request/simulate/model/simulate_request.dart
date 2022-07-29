import 'package:provider_app/API/request/simulate/model/simulate_goseki.dart';
import 'package:provider_app/API/request/simulate/model/simulate_skill.dart';
import 'package:provider_app/API/request/simulate/model/simulate_weapon_slot.dart';

import 'excluded_armor.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// part 'SimulateRequest.freezed.dart';

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

  SimulateRequest copyWith({
    List<SimulateSkill> simulateSkills,
    List<SimulateGoseki> simulateGosekis,
    List<ExcludedArmor> excludedArmors,
    SimulateWeaponSlot simulateWeaponSlot,
    int count,
    int minDefenseNum,
  }) =>
      SimulateRequest(
        simulateSkills: simulateSkills ?? this.simulateSkills,
        simulateGosekis: simulateGosekis ?? this.simulateGosekis,
        excludedArmors: excludedArmors ?? this.excludedArmors,
        simulateWeaponSlot: simulateWeaponSlot ?? this.simulateWeaponSlot,
        count: count ?? this.count,
        minDefenseNum: minDefenseNum ?? this.minDefenseNum,
      );

  Function isEqual = const ListEquality().equals;

  @override
  bool operator ==(Object other) =>
      identical(other, this) || other is SimulateRequest &&
          isEqual(simulateSkills, other.simulateSkills) &&
          isEqual(simulateGosekis, other.simulateGosekis) &&
          simulateWeaponSlot == other.simulateWeaponSlot &&
          isEqual(excludedArmors, other.excludedArmors) &&
          minDefenseNum == other.minDefenseNum &&
          count == other.count;

  @override
  int get hashCode => Object.hashAll([
    simulateSkills,
    simulateGosekis,
    simulateWeaponSlot,
    excludedArmors,
    minDefenseNum,
    count
  ]);
}
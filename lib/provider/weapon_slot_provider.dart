import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_app/API/request/simulate/model/simulate_weapon_slot.dart';
import 'package:provider_app/constant/configs.dart';

final weaponSlotProvider = ChangeNotifierProvider(
      (ref) => WeaponSlotSelector(),
);

class WeaponSlotSelector extends ChangeNotifier {
  int firstSlotValue = WeaponSlot.firstSlotDefaultValue;
  int secondSlotValue = WeaponSlot.secondSlotDefaultValue;
  int thirdSlotValue = WeaponSlot.thirdSlotDefaultValue;

  void setFirstSlot(int newValue) {
    firstSlotValue = newValue;
  }
  void setSecondSlot(int newValue) {
    secondSlotValue = newValue;
  }
  void setThirdSlot(int newValue) {
    thirdSlotValue = newValue;
  }
  SimulateWeaponSlot getSimulateWeaponSlot() {
    SimulateWeaponSlot simulateWeaponSlot = new SimulateWeaponSlot(
      firstSlot: firstSlotValue,
      secondSlot: secondSlotValue,
      thirdSlot: thirdSlotValue
    );
    return simulateWeaponSlot;
  }
}
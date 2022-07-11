import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/all.dart';
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
}
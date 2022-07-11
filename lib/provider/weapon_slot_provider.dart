import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_app/constant/configs.dart';

final weaponSlotProvider = ChangeNotifierProvider(
      (ref) => WeaponSlotSelector(),
);

class WeaponSlotSelector extends ChangeNotifier {
  void setFirstSlot(int newValue) {
    WeaponSlot.firstSlotDefaultValue = newValue;
  }
  void setSecondSlot(int newValue) {
    WeaponSlot.secondSlotDefaultValue = newValue;
  }
  void setThirdSlot(int newValue) {
    WeaponSlot.thirdSlotDefaultValue = newValue;
  }
}
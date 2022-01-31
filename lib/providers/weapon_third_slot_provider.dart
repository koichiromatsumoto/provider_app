import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_app/configs/weapon_slot.dart';

final weaponThirdSlotProvider = ChangeNotifierProvider(
      (ref) => WeaponThirdSlotSelector(),
);

class WeaponThirdSlotSelector extends ChangeNotifier {
  void handleChange(int newValue) {
    WeaponSlot.thirdSlotDefaultValue = newValue;
  }
}
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_app/configs/weapon_slot.dart';

final weaponFirstSlotProvider = ChangeNotifierProvider(
      (ref) => WeaponFirstSlotSelector(),
);

class WeaponFirstSlotSelector extends ChangeNotifier {
  void handleChange(int newValue) {
    WeaponSlot.firstSlotDefaultValue = newValue;
  }
}
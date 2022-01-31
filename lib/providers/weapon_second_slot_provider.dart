import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_app/configs/weapon_slot.dart';

final weaponSecondSlotProvider = ChangeNotifierProvider(
      (ref) => WeaponSecondSlotSelector(),
);

class WeaponSecondSlotSelector extends ChangeNotifier {
  void handleChange(int newValue) {
    WeaponSlot.secondSlotDefaultValue = newValue;
  }
}
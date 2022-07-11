import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

import '../constant/colors.dart';
import '../constant/configs.dart';
import '../provider/weapon_slot_provider.dart';

class WeaponSlotDropdown extends StatefulWidget {
  int value;
  int num;
  WeaponSlotDropdown(this.value, this.num);

  @override
  _WeaponSlotDropdownState createState() => _WeaponSlotDropdownState();
}

class _WeaponSlotDropdownState extends State<WeaponSlotDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: widget.value,
      onChanged: (newValue) {
        if (widget.num == WeaponSlot.first) {
          context.read(weaponSlotProvider).setFirstSlot(newValue);
        } else if (widget.num == WeaponSlot.second) {
          context.read(weaponSlotProvider).setSecondSlot(newValue);
        } else {
          context.read(weaponSlotProvider).setThirdSlot(newValue);
        }
        setState(() {
          widget.value = newValue;
        });
      },
      items: WeaponSlot.slotList.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}
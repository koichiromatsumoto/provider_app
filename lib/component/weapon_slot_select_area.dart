import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_app/component/weapon_slot_dropdown.dart';

import '../constant/colors.dart';
import '../constant/configs.dart';
import '../constant/strings.dart';
import '../provider/weapon_slot_provider.dart';

// 武器スロット選択エリア
class WeaponSlotSelectArea extends ConsumerStatefulWidget {
  BuildContext consumerContext;
  WeaponSlotSelectArea(this.consumerContext);

  @override
  _WeaponSlotSelectAreaState createState() => _WeaponSlotSelectAreaState();
}

class _WeaponSlotSelectAreaState extends ConsumerState<WeaponSlotSelectArea> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth,
      height: 60,
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                WEAPON_SLOT,
              ),
            ),
            WeaponSlotDropdown(ref.read(weaponSlotProvider).firstSlotValue, WeaponSlot.first),
            WeaponSlotDropdown(ref.read(weaponSlotProvider).secondSlotValue, WeaponSlot.second),
            WeaponSlotDropdown(ref.read(weaponSlotProvider).thirdSlotValue, WeaponSlot.third),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: const Border(
          bottom: const BorderSide(
            color: MAX_WIDTH_BTN_BORDER_COLOR,
          ),
        ),
      ),
    );
  }
}
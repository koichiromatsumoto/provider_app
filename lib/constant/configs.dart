class TabIndex {
  static const int SimulateIndex = 0;
  static const int FavoriteIndex = 1;
  static const int GosekiIndex = 2;
}

class WeaponSlot{
  static int first = 1;
  static int second = 2;
  static int third = 3;
  static int firstSlotDefaultValue = 0;
  static int secondSlotDefaultValue = 0;
  static int thirdSlotDefaultValue = 0;
  static const List<int> slotList = <int>[
    0,
    1,
    2,
    3,
    4,
  ];
}

enum ArmorPart{
  head,
  body,
  arm,
  waist,
  leg
}

extension ArmorPartExtension on ArmorPart {
  static final armorParts = {
    ArmorPart.head: 0,
    ArmorPart.body: 1,
    ArmorPart.arm: 2,
    ArmorPart.waist: 3,
    ArmorPart.leg: 4
  };

  int get armorPart => armorParts[this];
}

enum ArmorGrade{
  none,
  kai,
  jyoui,
  master,
}

extension ArmorGradeExtension on ArmorPart {
  static final armorGrades = {
    ArmorGrade.none: 99,
    ArmorGrade.kai: 0,
    ArmorGrade.jyoui: 1,
    ArmorGrade.master: 2,
  };

  int get armorGrade => armorGrades[this];
}
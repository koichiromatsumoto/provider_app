class ResWeaponSlot {
  final int firstSlot;
  final int secondSlot;
  final int thirdSlot;

  ResWeaponSlot({
    this.firstSlot,
    this.secondSlot,
    this.thirdSlot
  });

  factory ResWeaponSlot.fromSimulateApiMap(Map<String, dynamic> json) => ResWeaponSlot(
    firstSlot: json['firstSlot'] as int,
    secondSlot: json['secondSlot'] as int,
    thirdSlot: json['thirdSlot'] as int,
  );
}
class SimulateWeaponSlot {
  final int firstSlot;
  final int secondSlot;
  final int thirdSlot;

  SimulateWeaponSlot({
    this.firstSlot,
    this.secondSlot,
    this.thirdSlot,
  });

  Map<String, dynamic> toJson() => {
    'firstSlot': firstSlot,
    'secondSlot': secondSlot,
    'thirdSlot': thirdSlot,
  };
}
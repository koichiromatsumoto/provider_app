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

  @override
  bool operator ==(Object other) =>
      identical(other, this) || other is SimulateWeaponSlot &&
          firstSlot == other.firstSlot &&
          secondSlot == other.secondSlot &&
          thirdSlot == other.thirdSlot;

  @override
  int get hashCode => Object.hashAll([
    firstSlot,
    secondSlot,
    thirdSlot,
  ]);
}
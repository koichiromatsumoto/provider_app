class ExcludedArmor {
  final int armorId;
  final String armorName;

  ExcludedArmor({
    this.armorId,
    this.armorName,
  });

  Map<String, dynamic> toJson() => {
    'armorId': armorId,
    'armorName': armorName,
  };

  @override
  bool operator ==(Object other) =>
      identical(other, this) || other is ExcludedArmor &&
          armorId == other.armorId &&
          armorName == other.armorName;

  @override
  int get hashCode => Object.hashAll([
    armorId,
    armorName,
  ]);
}
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
}
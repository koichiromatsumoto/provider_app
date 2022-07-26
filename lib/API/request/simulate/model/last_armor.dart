class LastArmor {
  final int armorId;
  final String armorName;

  LastArmor({
    this.armorId,
    this.armorName,
  });

  Map<String, dynamic> toJson() => {
    'armorId': armorId,
    'armorName': armorName,
  };
}
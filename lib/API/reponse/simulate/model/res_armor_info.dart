class ResArmorInfo {
  final int armorId;
  final String armorName;
  final int part;

  ResArmorInfo({
    this.armorId,
    this.armorName,
    this.part
  });

  factory ResArmorInfo.fromSimulateApiMap(Map<String, dynamic> json) => ResArmorInfo(
    armorId: json['armorId'] as int,
    armorName: json['armorName'] as String,
    part: json['part'] as int,
  );
}
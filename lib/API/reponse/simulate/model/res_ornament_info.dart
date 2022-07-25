class ResOrnamentInfo {
  final int ornamentId;
  final String ornamentName;
  final int useNum;

  ResOrnamentInfo({
    this.ornamentId,
    this.ornamentName,
    this.useNum
  });

  factory ResOrnamentInfo.fromSimulateApiMap(Map<String, dynamic> json) => ResOrnamentInfo(
    ornamentId: json['ornamentId'] as int,
    ornamentName: json['name'] as String,
    useNum: json['useNum'] as int,
  );
}
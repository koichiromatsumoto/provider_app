class ResGoseki {
  final int gosekiId;

  ResGoseki({
    this.gosekiId,
  });

  factory ResGoseki.fromSimulateApiMap(Map<String, dynamic> json) => ResGoseki(
    gosekiId: json['gosekiId'] as int,
  );
}
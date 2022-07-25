class Goseki {
  final int id;
  int firstSkillId;
  String firstSkillName;
  int firstSkillLevel;
  int secondSkillId;
  String secondSkillName;
  int secondSkillLevel;
  int thirdSkillId;
  String thirdSkillName;
  int thirdSkillLevel;
  int firstSlot;
  int secondSlot;
  int thirdSlot;
  final DateTime createdAt;
  DateTime updatedAt;

  Goseki(
      {
        this.id,
        this.firstSkillId,
        this.firstSkillName,
        this.firstSkillLevel,
        this.secondSkillId,
        this.secondSkillName,
        this.secondSkillLevel,
        this.thirdSkillId,
        this.thirdSkillName,
        this.thirdSkillLevel,
        this.firstSlot,
        this.secondSlot,
        this.thirdSlot,
        this.createdAt,
        this.updatedAt
      }
  );

  factory Goseki.fromMap(Map<String, dynamic> json) => Goseki(
    id: json['id'] as int,
    firstSkillId: json['firstSkillId'] as int,
    firstSkillName: json['firstSkillName'] as String,
    firstSkillLevel: json['firstSkillLevel'] as int,
    secondSkillId: json['secondSkillId'] as int,
    secondSkillName: json['secondSkillName'] as String,
    secondSkillLevel: json['secondSkillLevel'] as int,
    thirdSkillId: json['thirdSkillId'] as int,
    thirdSkillName: json['thirdSkillName'] as String,
    thirdSkillLevel: json['thirdSkillLevel'] as int,
    firstSlot: json['firstSlot'] as int,
    secondSlot: json['secondSlot'] as int,
    thirdSlot: json['thirdSlot'] as int,
    createdAt: DateTime.parse(json['createdAt'] as String).toLocal(),
    updatedAt: DateTime.parse(json['updatedAt'] as String).toLocal()
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstSkillId': firstSkillId,
      'firstSkillName': firstSkillName,
      'firstSkillLevel': firstSkillLevel,
      'secondSkillId': secondSkillId,
      'secondSkillName': secondSkillName,
      'secondSkillLevel': secondSkillLevel,
      'thirdSkillId': thirdSkillId,
      'thirdSkillName': thirdSkillName,
      'thirdSkillLevel': thirdSkillLevel,
      'firstSlot': firstSlot,
      'secondSlot': secondSlot,
      'thirdSlot': thirdSlot,
      'createdAt': createdAt.toUtc().toIso8601String(),
      'updatedAt': updatedAt.toUtc().toIso8601String()
    };
  }

  Map<String, dynamic> toCreateMap() {
    if (firstSkillId == null && secondSkillId == null) {
      return null;
    } else if (firstSkillId == null && secondSkillId != null) {
      firstSkillId = secondSkillId;
      firstSkillName = secondSkillName;
      firstSkillLevel = secondSkillLevel;
      secondSkillId = null;
      secondSkillName = null;
      secondSkillLevel = null;
    }
    List<int> slotList = [firstSlot, secondSlot, thirdSlot];
    slotList.sort((a, b) => b.compareTo(a));
    return <String, dynamic>{
      'id': id,
      'firstSkillId': firstSkillId,
      'firstSkillName': firstSkillName,
      'firstSkillLevel': firstSkillLevel,
      'secondSkillId': secondSkillId,
      'secondSkillName': secondSkillName,
      'secondSkillLevel': secondSkillLevel,
      'thirdSkillId': thirdSkillId,
      'thirdSkillName': thirdSkillName,
      'thirdSkillLevel': thirdSkillLevel,
      'firstSlot': slotList[0],
      'secondSlot': slotList[1],
      'thirdSlot': slotList[2],
      'createdAt': DateTime.now().toUtc().toIso8601String(),
      'updatedAt': DateTime.now().toUtc().toIso8601String()
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return <String, dynamic>{
      'id': id,
      'firstSkillId': firstSkillId,
      'firstSkillName': firstSkillName,
      'firstSkillLevel': firstSkillLevel,
      'secondSkillId': secondSkillId,
      'secondSkillName': secondSkillName,
      'secondSkillLevel': secondSkillLevel,
      'thirdSkillId': thirdSkillId,
      'thirdSkillName': thirdSkillName,
      'thirdSkillLevel': thirdSkillLevel,
      'firstSlot': firstSlot,
      'secondSlot': secondSlot,
      'thirdSlot': thirdSlot,
      'createdAt': createdAt,
      'updatedAt': DateTime.now().toUtc().toIso8601String()
    };
  }

  static List<Goseki> gosekis = [
    Goseki(id: 1, firstSkillId: 1, firstSkillName: "攻撃", firstSkillLevel: 3, secondSkillId: 2, secondSkillName: "防御", secondSkillLevel: 2, firstSlot: 3, secondSlot: 2, thirdSlot: 1, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Goseki(id: 2, firstSkillId: 3, firstSkillName: "反動軽減", firstSkillLevel: 3, secondSkillId: 4, secondSkillName: "気絶耐性", secondSkillLevel: 2, firstSlot: 2, secondSlot: 1, thirdSlot: 1, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    Goseki(id: 3, firstSkillId: 5, firstSkillName: "ひるみ軽減", firstSkillLevel: 3, secondSkillId: null, secondSkillName: null, secondSkillLevel: null, firstSlot: 0, secondSlot: 0, thirdSlot: 0, createdAt: DateTime.now(), updatedAt: DateTime.now())
  ];
}
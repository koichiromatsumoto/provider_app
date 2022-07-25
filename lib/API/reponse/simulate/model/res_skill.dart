class ResSkill {
  final int skillId;
  final String skillName;
  final int selectedLevel;

  ResSkill({
    this.skillId,
    this.skillName,
    this.selectedLevel
  });

  factory ResSkill.fromSimulateApiMap(Map<String, dynamic> json) => ResSkill(
    skillId: json['skillId'] as int,
    skillName: json['skillName'] as String,
    selectedLevel: json['selectedLevel'] as int,
  );
}
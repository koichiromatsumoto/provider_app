class ResActivateSkillInfo {
  final int skillId;
  final String skillName;
  final int skillLevel;

  ResActivateSkillInfo({
    this.skillId,
    this.skillName,
    this.skillLevel
  });

  factory ResActivateSkillInfo.fromSimulateApiMap(Map<String, dynamic> json) => ResActivateSkillInfo(
    skillId: json['skillId'] as int,
    skillName: json['skillName'] as String,
    skillLevel: json['skillLevel'] as int,
  );
}
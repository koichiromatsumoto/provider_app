class SimulateSkill {
  final int skillId;
  final String skillName;
  final int selectedLevel;

  SimulateSkill({
    this.skillId,
    this.skillName,
    this.selectedLevel,
  });

  Map<String, dynamic> toJson() => {
    'skillId': skillId,
    'skillName': skillName,
    'selectedLevel': selectedLevel
  };
}
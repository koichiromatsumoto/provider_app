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

  @override
  bool operator ==(Object other) =>
      identical(other, this) || other is SimulateSkill &&
          skillId == other.skillId &&
          skillName == other.skillName &&
          selectedLevel == other.selectedLevel;

  @override
  int get hashCode => Object.hashAll([skillId, skillName, selectedLevel]);
}
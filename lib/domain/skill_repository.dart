import 'package:provider_app/domain/skills.dart';

abstract class SkillRepository {
  Future<Skill> create({
    int id,
    String skillName,
    int maxLevel,
    DateTime now,
  });
  Future<List<Skill>> findAll();
  Future<Skill> find({int id});
  Future<void> update({Skill skill});
  Future<void> delete({int id});
}
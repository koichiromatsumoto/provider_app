import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_app/model/repository/goseki_repository.dart';

import '../API/request/simulate/model/simulate_goseki.dart';
import '../model/entity/gosekis.dart';

final gosekiProvider = ChangeNotifierProvider(
      (ref) => GosekiSelector(),
);

class GosekiSelector extends ChangeNotifier {
  List<Goseki> gosekis = [];
  List<SimulateGoseki> simulateGoseki = [];

  Future<void> setGosekiList() async {
    gosekis = await GosekiRepository.getAll();
  }
  void addGoseki(Goseki newValue) {
    gosekis.add(newValue);
  }
  void addGosekiList(List<Goseki> newValue) {
    for (var goseki in newValue) {
      gosekis.add(goseki);
    }
  }

  List<SimulateGoseki> getSimulateGoseki () {
    List<SimulateGoseki> simulateGosekis = [];
    for (var goseki in gosekis) {
      SimulateGoseki simulateGoseki = new SimulateGoseki(
          gosekiId: goseki.id,
          firstSkillId: goseki.firstSkillId,
          firstSkillName: goseki.firstSkillName,
          firstSkillLevel: goseki.firstSkillLevel,
          secondSkillId: goseki.secondSkillId,
          secondSkillName: goseki.secondSkillName,
          secondSkillLevel: goseki.secondSkillLevel,
          thirdSkillId: goseki.thirdSkillId,
          thirdSkillName: goseki.thirdSkillName,
          thirdSkillLevel: goseki.thirdSkillLevel,
          firstSlot: goseki.firstSlot,
          secondSlot: goseki.secondSlot,
          thirdSlot: goseki.thirdSlot
      );
      simulateGosekis.add(simulateGoseki);
    }
    return simulateGosekis;
  }
}
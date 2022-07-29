import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_app/API/reponse/simulate/model/simulate_response.dart';
import 'package:provider_app/API/request/simulate/model/simulate_request.dart';

import '../API/reponse/addable_skill/model/res_addable_skills.dart';

final simulateResultProvider = ChangeNotifierProvider(
      (ref) => SimulateResultSelector(),
);

class SimulateResultSelector extends ChangeNotifier {
  SimulateResponse simulateResponse;
  SimulateRequest simulateRequest;
  List<ResAddableSkill> resAddableSkills;

  void setSimulateInfo(SimulateRequest newSimulateRequest, SimulateResponse newSimulateResponse) {
    simulateRequest = newSimulateRequest;
    simulateResponse = newSimulateResponse;
  }
  void setAddableSimulateInfo(List<ResAddableSkill> newResAddableSkills) {
    resAddableSkills = newResAddableSkills;
  }
}
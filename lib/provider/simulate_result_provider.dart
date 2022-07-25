import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/all.dart';

import '../API/reponse/simulate/model/res_armor.dart';

final simulateResultProvider = ChangeNotifierProvider(
      (ref) => SimulateResultSelector(),
);

class SimulateResultSelector extends ChangeNotifier {
  List<ResArmor> resArmors = [];

  void setResArmor(List<ResArmor> newValue) {
    resArmors = newValue;
  }
}
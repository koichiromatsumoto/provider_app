import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/all.dart';

final counterProvider = ChangeNotifierProvider(
      (ref) => Counter(),
);

class Counter extends ChangeNotifier {
  var _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
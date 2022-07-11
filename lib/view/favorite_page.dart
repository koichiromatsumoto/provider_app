import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_app/constant/configs.dart';
import 'package:provider_app/provider/counter_provider.dart';
import 'package:provider_app/provider/navigation_history_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("お気に入り装備"),
        centerTitle: true,
      ),
      body: Consumer(
          builder: (context, watch, child){
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('お気に入り装備のタブです'),
                  ElevatedButton(
                      child: const Text('装備検索を表示'),
                      onPressed: () => context.read(navigationHistoryProvider).moveTo(TabIndex.SimulateIndex)),
                  ElevatedButton(
                      child: const Text('護石を表示'),
                      onPressed: () => context.read(navigationHistoryProvider).moveTo(TabIndex.GosekiIndex)),
                  ElevatedButton(
                      child: const Text('もどる'),
                      onPressed: context.read(navigationHistoryProvider).hasHistory ? context.read(navigationHistoryProvider).pop : null),
                  Text(
                      '${watch(counterProvider).count} 回押しました！'
                  ),
                ]
            );
          }
      ),
    );
  }
}
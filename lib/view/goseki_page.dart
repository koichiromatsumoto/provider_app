import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_app/view/simulate_detail_setting_page.dart';
import 'package:provider_app/provider/navigation_history_provider.dart';

class GosekiPage extends StatelessWidget {
  const GosekiPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("護石登録"),
        centerTitle: true,
      ),
      body: Consumer(
          builder: (context, watch, child){
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('護石のタブです'),
                  ElevatedButton(
                      child: const Text('別のページを開く'),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute<PageRoute<Widget>>(
                              builder: (_) => SimulateDetailSettingPage()))),
                  ElevatedButton(
                      child: const Text('もどる'),
                      onPressed: context.read(navigationHistoryProvider).hasHistory ? context.read(navigationHistoryProvider).pop : null),
                ]
            );
          }
      ),
    );
  }
}
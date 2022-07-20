import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/strings.dart';

class SimulateDetailSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(SIMULATE_DETAIL_SETTING),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('検索詳細設定のページ'),
                ElevatedButton(
                    child: const Text('もとのページに戻る'),
                    onPressed: () => Navigator.of(context).pop()
                ),
              ]
          )
      )
  );
}
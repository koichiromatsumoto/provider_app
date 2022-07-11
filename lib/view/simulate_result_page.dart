import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimulateResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("検索結果"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('検索結果のページ'),
                ElevatedButton(
                    child: const Text('もとのページに戻る'),
                    onPressed: () => Navigator.of(context).pop()
                ),
              ]
          )
      )
  );
}
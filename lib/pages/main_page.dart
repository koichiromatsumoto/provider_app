import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_app/configs/skills.dart';
import 'package:provider_app/pages/simulate_page.dart';
import 'package:provider_app/providers/navigation_history_provider.dart';

import 'favorite_page.dart';
import 'goseki_page.dart';
class MainPage extends StatelessWidget {

  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer(
        builder: (context, watch, child) {
          return CupertinoTabScaffold(
            controller: context.read(navigationHistoryProvider).controller,
            tabBar: CupertinoTabBar(
              items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: '装備検索'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'お気に入り'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.edit), label: '護石登録'),
                ],
                activeColor: Colors.blueAccent,
            ),
            tabBuilder: (BuildContext context, int index) =>
              Navigator(
                initialRoute: 'main/tabs',
                onGenerateRoute: (RouteSettings settings) =>
                  MaterialPageRoute<PageRoute<Widget>>(
                    settings: settings,
                    builder: (_) =>
                    <Widget>[
                      SimulatePage(),
                      FavoritePage(),
                      GosekiPage(),
                    ][index]
                  )
              )
          );
        }
      )
    );
  }
}
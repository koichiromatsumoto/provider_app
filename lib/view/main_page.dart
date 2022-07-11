import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_app/constant/colors.dart';
import 'package:provider_app/constant/strings.dart';
import 'package:provider_app/view/simulate_page.dart';
import 'package:provider_app/provider/navigation_history_provider.dart';

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
                      icon: Icon(Icons.search), label: AppString.SIMULATE_PAGE),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: AppString.FAVORITE_PAGE),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.edit), label: AppString.GOSEKI_PAGE),
                ],
                activeColor: AppColor.SECOND_THEME_COLOR,
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
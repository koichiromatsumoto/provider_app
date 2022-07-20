import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_app/constant/strings.dart';
import 'package:provider_app/view/main_page.dart';

import 'constant/colors.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    const locale = Locale("ja", "JP");
    return MaterialApp(
      title: TITLE,
      theme: ThemeData(
        primarySwatch: THEME_COLOR,
        accentColor: SECOND_THEME_COLOR,
      ),
      darkTheme: ThemeData.dark(),
      home: MainPage(),
      locale: locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        locale,
      ],
    );
  }
}
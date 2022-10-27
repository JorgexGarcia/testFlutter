import 'package:flutter/material.dart';
import 'package:flutter03/pages/alert_pages.dart';
import 'package:flutter03/pages/avatar_pages.dart';
import 'package:flutter03/pages/cards_pages.dart';
import 'package:flutter03/pages/home_pages.dart';
import 'package:flutter03/pages/inputs_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es')
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String,WidgetBuilder>{
          '/': (BuildContext) => HomePage(),
          'alert': (BuildContext) => AlertPage(),
          'avatar': (BuildContext) => AvatarPage(),
          'cards': (BuildContext) => CardsPage(),
          'inputs': (BuildContext) => InputsPage(),
      },
    );
  }
}

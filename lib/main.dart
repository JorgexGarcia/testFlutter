import 'package:flutter/material.dart';
import 'package:flutter03/pages/alert_pages.dart';
import 'package:flutter03/pages/avatar_pages.dart';
import 'package:flutter03/pages/home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String,WidgetBuilder>{
          '/': (BuildContext) => HomePage(),
          'alert': (BuildContext) => AlertPage(),
          'avatar': (BuildContext) => AvatarPage(),
      },
    );
  }
}

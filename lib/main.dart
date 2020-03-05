import 'package:fluttcher/pages/modules/modules.page.dart';
import 'package:flutter/material.dart';

import 'pages/home/home.page.dart';
import 'pages/splash/splash.page.dart';
import 'shared/constants/app.constants.dart';

/// Main function - runs app
void main() => runApp(MyApp());

/// Main class of the app
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: kAppTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.amber,
            accentColor: Colors.indigoAccent,
            accentIconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.pink),
        home: SplashPage(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomePage(title: kAppTitle),
          '/modules': (BuildContext context) => ModulesPage(title: kAppTitle),
        });
  }
}

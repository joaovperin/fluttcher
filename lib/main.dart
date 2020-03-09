import 'dart:io';

//import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_analytics/observer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttcher/core/background/background-handler.service.dart';
import 'package:fluttcher/pages/modules/modules.page.dart';
import 'package:flutter/material.dart';

import 'core/ui/dialogs/dialogs.service.dart';
import 'pages/splash/splash.page.dart';
import 'shared/constants/app.constants.dart';

/// Main function - runs app
void main() => runApp(MyApp());
//FirebaseAnalytics analytics = FirebaseAnalytics();

Future<dynamic> backgroundMessageHandler(Map<String, dynamic> message) {
  print("MESSAGE RECEIVED ON BACKGROUND!!");
  print(message);

  if (message.containsKey('data')) {
// Handle data message
    final dynamic data = message['data'];
    print(data);
  }

  if (message.containsKey('notification')) {
// Handle notification message
    final dynamic notification = message['notification'];
    print(notification);
  }

// Or do other work.
  return null;
}

///
/// Main class of the app
///
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

/// State of the main class of the app
class _MyAppState extends State<MyApp> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onBackgroundMessage: Platform.isIOS ? null : backgroundMessageHandler,
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print("FIREBASE_TOKEN = $token");
    });
  }

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
        '/modules': (BuildContext context) => ModulesPage(title: kAppTitle),
      },
//      navigatorObservers: [
//        FirebaseAnalyticsObserver(analytics: analytics),
//      ],
    );
  }
}

import 'package:fluttcher/pages/modules/modules.page.dart';
import 'package:fluttcher/shared/constants/app.constants.dart';
import 'package:flutter/material.dart';

///
/// SplashPage
///
class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

///
/// State for the SplashPage
///
class SplashPageState extends State<SplashPage> {
  static const kSplashDurationSeconds = 3;

  @override
  initState() {
    super.initState();
    _gotoHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  void _gotoHomePage() async {
    Future.delayed(Duration(seconds: kSplashDurationSeconds), () {
      // Navigate to home page
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ModulesPage(title: kAppTitle)));
    });
  }
}

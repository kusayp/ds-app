import 'package:dsapp/utils/routes.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme(),
        initialRoute: '/',
        routes: routes,

//      home: OnBoardingPage(),
    );
  }
}


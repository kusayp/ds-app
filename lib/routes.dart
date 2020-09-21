import 'package:dsapp/screens/login/login-screen.dart';
import 'package:dsapp/screens/menu/menu-page.dart';
import 'package:dsapp/screens/onboarding/onboarding-page.dart';
import 'package:dsapp/screens/users/users-screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder> {
  "/": (BuildContext context) => OnBoardingPage(),
  "/users": (BuildContext context) => UsersScreen(),
  "/login": (BuildContext context) => UserLoginScreen(),
  "/menu": (BuildContext context) => MenuPage(),

};
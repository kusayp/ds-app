import 'package:dsapp/models/models.dart';
import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
  new GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName, UserModel arguments) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }
}
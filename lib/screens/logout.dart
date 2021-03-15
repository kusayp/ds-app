import 'dart:io';

import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  final LoginService service = LoginService();
  void logoutUser(BuildContext context) async {
    LocalStorage prefs = LocalStorage();
    // String userString = await prefs.getSharedPreference("user");
    // LoginResponse user = LoginResponse.fromJson(userString);
    await prefs?.setSharedPreference("user", null);
    await prefs?.setSharedPreference("fcm token", null);
    // await service.updateUser(1, user, null);
    Navigator.pushNamedAndRemoveUntil(
        context,
       "/users",
        ModalRoute.withName('/users')
    );
  }

  @override
  Widget build(BuildContext context) {
    if(true) {
      try{
        final result = InternetAddress.lookup('example.com');
        if (result != null){
          Future.delayed(Duration(milliseconds: 5)  ,() => logoutUser(context));
        }
      } on SocketException catch (_) {
        print("No connection");
      }
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  final LoginService service = LoginService();
  void logoutUser(BuildContext context) async {
    LocalStorage prefs = LocalStorage();
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);
    prefs?.setUserDetails(null);
    await service.updateUser(1, user, null);
    Navigator.pushNamedAndRemoveUntil(
        context,
       "/users",
        ModalRoute.withName('/users')
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(true){
      Future.delayed(Duration(milliseconds: 5)  ,() => logoutUser(context));
    }
    return Scaffold(
      backgroundColor: appTheme().backgroundColor,
    );
  }
}

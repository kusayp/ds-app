import 'package:dsapp/utils/shared-preference.dart';
import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  void logoutUser(BuildContext context) {
    LocalStorage prefs = LocalStorage();
    prefs?.setUserDetails(null);
    Navigator.pushNamedAndRemoveUntil(
        context,
       "/login",
        ModalRoute.withName('/login')
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(true){
      Future.delayed(Duration(milliseconds: 5)  ,() => logoutUser(context));
    }
    return Container();
  }
}

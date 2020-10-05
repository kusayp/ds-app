import 'package:dsapp/screens/profile/profile-screen.dart';
import 'package:dsapp/theme/style.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: ProfileScreen(),
    );
  }
}

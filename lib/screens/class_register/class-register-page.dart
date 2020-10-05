import 'package:dsapp/screens/class_register/class-register-screen.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class ClassRegisterPage extends StatelessWidget {
  static const routeName = '/class register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Class Register",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: ClassRegisterScreen(),
    );
  }
}

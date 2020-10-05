import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class SubmitAnswerPage extends StatelessWidget {
  static const routeName = '/submit_assignment';
  @override
  Widget build(BuildContext context) {
    final String arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Submit Assignment",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: SubmitAnswerScreen(),
    );
  }
}
